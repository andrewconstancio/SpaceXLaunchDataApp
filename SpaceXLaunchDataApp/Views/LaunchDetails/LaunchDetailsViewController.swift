//
//  LaunchViewController.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/24/22.
//

import UIKit
import YouTubeiOSPlayerHelper


/// A view controller to diplsay launch detail info
///
class LaunchDetailsViewController: UIViewController {
    
    /// launch details launch object
    var launch: Launch?
    
    /// launch detail collection view
    let launchDetailsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up launch detail collection view
        setupLaunchDetailCollectionView()
    }
    
    /// set up launch detail collection view funcion
    ///
    func setupLaunchDetailCollectionView() {
        self.launchDetailsCollectionView.backgroundColor = .white
        self.launchDetailsCollectionView.dataSource = self
        self.launchDetailsCollectionView.delegate = self
        self.launchDetailsCollectionView.register(
            LaunchDetailBodyCell.self,
            forCellWithReuseIdentifier: LaunchDetailBodyCell.identifer
        )
        self.launchDetailsCollectionView.register(
            LaunchDetailHeaderCell.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: LaunchDetailHeaderCell.identifier
        )
        self.launchDetailsCollectionView.automaticallyAdjustsScrollIndicatorInsets = false
        self.launchDetailsCollectionView.backgroundColor = .dynamicColor(light: .systemGray6, dark: .black)
        self.view.addSubview(launchDetailsCollectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.launchDetailsCollectionView.frame = view.bounds
    }
}
