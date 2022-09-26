//
//  LaunchViewController.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/24/22.
//

import UIKit
import YouTubeiOSPlayerHelper

class LaunchViewController: UIViewController {
    
    var launch: Launch?
    
    let launchDetailCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLaunchDetailCollectionView()
    }
    
    func setupLaunchDetailCollectionView() {
        self.launchDetailCollectionView.backgroundColor = .white
        self.launchDetailCollectionView.dataSource = self
        self.launchDetailCollectionView.delegate = self
        self.launchDetailCollectionView.register(LaunchDetailBodyCell.self, forCellWithReuseIdentifier: LaunchDetailBodyCell.identifer)
        self.launchDetailCollectionView.register(LaunchDetailHeaderCell.self,
                                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                                 withReuseIdentifier: LaunchDetailHeaderCell.identifier)
        self.launchDetailCollectionView.automaticallyAdjustsScrollIndicatorInsets = false
        self.launchDetailCollectionView.backgroundColor = .dynamicColor(light: .systemGray6, dark: .black)
        self.view.addSubview(launchDetailCollectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.launchDetailCollectionView.frame = view.bounds
    }
    
}
