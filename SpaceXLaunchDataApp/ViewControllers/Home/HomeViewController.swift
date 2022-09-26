//
//  ViewController.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/22/22.
//

import UIKit


class HomeViewController: UIViewController {
    
    var delegate: HomeViewControllerDelegate?
    
    // header cell ID for home collection view cell
    var headerCellID = "headerCellID"
    var homeViewModel = HomeViewModel()
    
    // home collection view
    let homeCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up come collection view
        setUpHomeCollectionView()
        
        // show / hide spinner of loading state
        homeViewModel.isLoading.bind { [weak self] _ in
            DispatchQueue.main.async {
                if self?.homeViewModel.isLoading.value == true {
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
    
    // set up home collection view
    func setUpHomeCollectionView() {
        self.homeCollectionView.backgroundColor = .white
        self.homeCollectionView.dataSource = self
        self.homeCollectionView.delegate = self
        self.homeCollectionView.register(LaunchHomeCell.self, forCellWithReuseIdentifier: LaunchHomeCell.identifier)
        self.homeCollectionView.register(HomeHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCellID)
        self.homeCollectionView.automaticallyAdjustsScrollIndicatorInsets = false
        self.homeCollectionView.backgroundColor = .dynamicColor(light: .systemGray6, dark: .black)
        self.view.addSubview(homeCollectionView)
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeCollectionView.frame = view.bounds
    }
    
}
