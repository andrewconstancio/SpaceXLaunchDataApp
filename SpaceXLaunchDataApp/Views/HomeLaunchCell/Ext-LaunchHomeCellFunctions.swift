//
//  Ext-LaunchHomeCellFunctions.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/23/22.
//

import UIKit
import SDWebImage

extension LaunchHomeCell {
    
    //set up views for launch home cells
    func setUpViews() {
        // anchor outer view
        addSubview(basicCellContainerView)
        basicCellContainerView
            .anchor(top: topAnchor, left: leftAnchor,
                    bottom: bottomAnchor, right: rightAnchor,
                    centerX: nil, centerY: nil,
                    paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0,
                    width: 0, height: 0, xPadding: 0, yPadding: 0)

        
        // anchor mission name label
        addSubview(missionNameLabel)
        missionNameLabel.anchor(top: topAnchor, left: basicCellContainerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 200, height: 20, xPadding: 0, yPadding: 0)
        
        
        // launch site name label
        addSubview(launchSiteNameLabel)
        launchSiteNameLabel.anchor(top: missionNameLabel.bottomAnchor, left: basicCellContainerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 200, height: 20, xPadding: 0, yPadding: 0)
        
        // date of launch label
        addSubview(dateOfLaunchLabel)
        dateOfLaunchLabel.anchor(top: launchSiteNameLabel.bottomAnchor, left: basicCellContainerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 5, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 200, height: 20, xPadding: 0, yPadding: 0)
        
        // anchor rocket name label
        addSubview(rocketNameLabel)
        rocketNameLabel.anchor(top: dateOfLaunchLabel.bottomAnchor, left: basicCellContainerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, xPadding: 0, yPadding: 0)
        
        // anchor launch patch image
        addSubview(launchImage)
        launchImage.anchor(top: nil, left: nil, bottom: nil, right: basicCellContainerView.rightAnchor, centerX: nil, centerY: basicCellContainerView.centerYAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 100, height: 100, xPadding: 0, yPadding: 0)
        
    }
    
}
