//
//  Ext-LaunchHomeHeaderCellFunctions.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/23/22.
//

import UIKit


extension HomeHeaderCell {
    
    // set up views for home header cell
    func setUpViews(){
        // anchor launch label
        addSubview(launchLabel)
        launchLabel.anchor(top: nil, left: leftAnchor,
                    bottom: bottomAnchor, right: nil,
                    centerX: nil, centerY: nil,
                    paddingTop: 0, paddingLeft: 10, paddingBottom: 20, paddingRight: 0,
                    width: 0, height: 0, xPadding: 0, yPadding: 0)
        
        // anchor spaceX label
        addSubview(spaceXLabel)
        spaceXLabel.anchor(top: nil, left: leftAnchor,
                           bottom: launchLabel.topAnchor, right: nil,
                    centerX: nil, centerY: nil,
                    paddingTop: 0, paddingLeft: 10, paddingBottom: -5, paddingRight: 0,
                    width: 0, height: 0, xPadding: 0, yPadding: 0)
    }
}
