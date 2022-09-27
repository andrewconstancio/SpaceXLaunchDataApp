//
//  ViewController.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/22/22.
//

import UIKit

/// A view controller to display a list of space x launches
/// 
class HomeViewController: UIViewController, UISearchControllerDelegate, UISearchResultsUpdating {
    
    /// Home view search bar
    let searchController = UISearchController(searchResultsController: nil)
        
    /// Home view controller protocol
    var delegate: HomeControllerDelegate?
    
    /// Home view controller view model
    var homeViewModel = HomeViewModel()
    
    /// home collection view with list of space x launches
    let homeCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up come collection view
        setUpHomeCollectionView()
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.definesPresentationContext = true
        searchController.searchResultsUpdater = self

        // set up naviagtion bar
        setUpNavigationBar()
        
        // show / hide spinner of loading state
        homeViewModel.isLoading.bind { [weak self] isLoading in
            DispatchQueue.main.async {
                if isLoading == true {
                    self?.showSpinner(onView: self?.view ?? UIView())
                } else {
                    self?.removeSpinner()
                }
            }
        }
        
        // reload collection view data from home view model
        homeViewModel.launches.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.homeCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    /// Filters launch list data from search bar
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        if searchText == " "  {
            homeViewModel.launchesFiltered.value = homeViewModel.launches.value
            homeCollectionView.reloadData()
        } else {
            let arrayWithNoOptionals = homeViewModel.launches.value?.compactMap { $0 }
            homeViewModel.launchesFiltered.value = arrayWithNoOptionals?.filter({ (launch) -> Bool in
                return (launch.missionName?.localizedCaseInsensitiveContains(String(searchText)))!
            })
        }
        homeCollectionView.reloadData()
    }

    /// Sets up home naviagtion bar
    func setUpNavigationBar() {
        title = "Space X Launches"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = self.searchController
    }
    
    /// set up home collection view
    func setUpHomeCollectionView() {
        self.homeCollectionView.backgroundColor = .white
        self.homeCollectionView.dataSource = self
        self.homeCollectionView.delegate = self
        self.homeCollectionView.register(HomeLaunchCell.self, forCellWithReuseIdentifier: HomeLaunchCell.identifier)
        self.homeCollectionView.automaticallyAdjustsScrollIndicatorInsets = false
        self.homeCollectionView.backgroundColor = .dynamicColor(light: .systemGray6, dark: .black)
        self.view.addSubview(homeCollectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeCollectionView.frame = view.bounds
    }
}
