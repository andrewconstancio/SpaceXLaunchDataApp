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
        
//        view.backgroundColor = .dynamicColor(light: .systemGray6, dark: .black)
//
//        view.addSubview(detailViewContainerMain)
//        view.addSubview(missionNameLabel)
//        view.addSubview(dateOfLaunchLabel)
//        view.addSubview(playerView)
//        view.addSubview(successFailLabel)
//        view.addSubview(detailViewContainerRocket)
//        view.addSubview(rocketLabel)
//
//        missionNameLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 50, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)
//
//        dateOfLaunchLabel.anchor(top: missionNameLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 5, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)
//
//        playerView.anchor(top: dateOfLaunchLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 250, xPadding: 0, yPadding: 0)
//
//        successFailLabel.anchor(top: playerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)
//
//
//        detailViewContainerRocket.anchor(top: detailViewContainerMain.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100, xPadding: 0, yPadding: 0)
//
//        rocketLabel.anchor(top: detailViewContainerRocket.topAnchor, left: detailViewContainerRocket.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 15, paddingBottom: 10, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)
//
//        detailViewContainerMain.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: successFailLabel.bottomAnchor, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 15, paddingLeft: 0, paddingBottom: -10, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)
//        let isoDate = launch?.launchDateUTC ?? ""
//        let siteName = launch?.launchSite?.siteName ?? ""
//
//        missionNameLabel.text = launch?.missionName
//        launchSiteNameLabel.text = "\u{2000}\(siteName)"
//        dateOfLaunchLabel.text = "\u{2000}\(isoDate.fromUTCToLocalDate())"
//        dateOfLaunchLabel.addSystemImage(imageName: "calendar", afterLabel: false)
//
//        let successOfLaunch  = launch?.launchSuccess ?? false
//        if successOfLaunch {
//            successFailLabel.text = "Success"
//            successFailLabel.backgroundColor = .systemGreen
//        } else {
//            successFailLabel.text = "Fail"
//            successFailLabel.backgroundColor = .systemRed
//        }
//
//        self.playerView.load(withVideoId: self.launch?.links?.youtubeID ?? "")
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
