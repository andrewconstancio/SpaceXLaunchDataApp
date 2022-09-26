//
//  Ext-LaunchDetailHeaderCellFunctions.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/25/22.
//

extension LaunchDetailHeaderCell {
    
    //set up cell sub views 
    func setupViews() {

        //add subviews
        addSubview(basicCellContainerView)
        addSubview(missionNameLabel)
        addSubview(dateOfLaunchLabel)
        addSubview(playerView)
        addSubview(successFailLabel)
        
        //add contraints
        basicCellContainerView
            .anchor(top: topAnchor, left: leftAnchor,
                    bottom: bottomAnchor, right: rightAnchor,
                    centerX: nil, centerY: nil,
                    paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0,
                    width: 0, height: 0, xPadding: 0, yPadding: 0)
        
        missionNameLabel.anchor(top: basicCellContainerView.topAnchor, left: basicCellContainerView.leftAnchor, bottom: nil, right: basicCellContainerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 50, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)

        dateOfLaunchLabel.anchor(top: missionNameLabel.bottomAnchor, left: basicCellContainerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 5, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)
        
        playerView.anchor(top: dateOfLaunchLabel.bottomAnchor, left: basicCellContainerView.leftAnchor, bottom: nil, right: basicCellContainerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 250, xPadding: 0, yPadding: 0)
        
        successFailLabel.anchor(top: playerView.bottomAnchor, left: basicCellContainerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 15, paddingLeft: 20, paddingBottom: 10, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)
        
    }
}
