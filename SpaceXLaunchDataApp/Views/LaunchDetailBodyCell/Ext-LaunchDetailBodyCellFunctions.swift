//
//  Ext-LaunchDetailBodyCellFunctions.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/25/22.
//

extension LaunchDetailBodyCell {
    // set up views for home header cell
    func setupViews(){
        
        // add sub views
        addSubview(rocketInfoContainerView)
        addSubview(rocketNameLabel)
        addSubview(coreContainer)
        addSubview(coreInfoLabel)
        addSubview(payloadContainer)
        addSubview(payloadLabel)
        addSubview(payloadInfoSubLabel)
        addSubview(payloadCustomerLabel)
        addSubview(payloadCustomerInfoLabel)
        addSubview(payloadTypeLabel)
        addSubview(payloadTypeInfoLabel)
        addSubview(payloadMassLabel)
        addSubview(payloadMassInfoLabel)
        addSubview(payloadNationalityLabel)
        addSubview(payloadNationalityInfoLabel)
        addSubview(payloadOrbitLabel)
        addSubview(payloaOrbitInfoLabel)
        addSubview(missionDetailContainer)
        addSubview(missionDetailLabel)
        addSubview(missionInfoTextView)
        addSubview(patchImage)
        
        
        rocketInfoContainerView
            .anchor(top: topAnchor, left: leftAnchor,
                    bottom: nil, right: rightAnchor,
                    centerX: nil, centerY: nil,
                    paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0,
                    width: 0, height: 45, xPadding: 0, yPadding: 0)
        
        
        rocketNameLabel.anchor(top: rocketInfoContainerView.topAnchor, left: rocketInfoContainerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)
        
        coreContainer
            .anchor(top: rocketInfoContainerView.bottomAnchor, left: leftAnchor,
                    bottom: nil, right: rightAnchor,
                    centerX: nil, centerY: nil,
                    paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0,
                    width: 0, height: 45, xPadding: 0, yPadding: 0)
        
        coreInfoLabel.anchor(top: coreContainer.topAnchor, left: coreContainer.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)
        
        payloadContainer
            .anchor(top: coreContainer.bottomAnchor, left: leftAnchor,
                    bottom: nil, right: rightAnchor,
                    centerX: nil, centerY: nil,
                    paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0,
                    width: 0, height: 225, xPadding: 0, yPadding: 0)
        
        payloadLabel.anchor(top: payloadContainer.topAnchor, left: payloadContainer.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)
        
        payloadInfoSubLabel.anchor(top: payloadLabel.bottomAnchor, left: payloadContainer.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)
        
        payloadCustomerLabel.anchor(top: payloadInfoSubLabel.bottomAnchor, left: payloadContainer.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)
        
        payloadCustomerInfoLabel.anchor(top: payloadInfoSubLabel.bottomAnchor, left: nil, bottom: nil, right: payloadContainer.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: 0, height: 0, xPadding: 0, yPadding: 0)
        
        payloadTypeLabel.anchor(top: payloadCustomerLabel.bottomAnchor, left: payloadContainer.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)
        
        payloadTypeInfoLabel.anchor(top: payloadCustomerInfoLabel.bottomAnchor, left: nil, bottom: nil, right: payloadContainer.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: 0, height: 0, xPadding: 0, yPadding: 0)
 
        
        
        payloadMassLabel.anchor(top: payloadTypeLabel.bottomAnchor, left: payloadContainer.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)
        
        payloadMassInfoLabel.anchor(top: payloadTypeInfoLabel.bottomAnchor, left: nil, bottom: nil, right: payloadContainer.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: 0, height: 0, xPadding: 0, yPadding: 0)
    
        
        
        
        payloadNationalityLabel.anchor(top: payloadMassLabel.bottomAnchor, left: payloadContainer.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)
        
        payloadNationalityInfoLabel.anchor(top: payloadMassInfoLabel.bottomAnchor, left: nil, bottom: nil, right: payloadContainer.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: 0, height: 0, xPadding: 0, yPadding: 0)
        
        
        payloadOrbitLabel.anchor(top: payloadNationalityLabel.bottomAnchor, left: payloadContainer.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)
        
        payloaOrbitInfoLabel.anchor(top: payloadNationalityInfoLabel.bottomAnchor, left: nil, bottom: nil, right: payloadContainer.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: 0, height: 0, xPadding: 0, yPadding: 0)
        
        missionDetailContainer
            .anchor(top: payloadContainer.bottomAnchor, left: leftAnchor,
                    bottom: nil, right: rightAnchor,
                    centerX: nil, centerY: nil,
                    paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0,
                    width: 0, height: 500, xPadding: 0, yPadding: 0)
        
        missionDetailLabel.anchor(top: missionDetailContainer.topAnchor, left: missionDetailContainer.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)
        
        missionInfoTextView
            .anchor(top: missionDetailLabel.bottomAnchor, left:     missionDetailContainer.leftAnchor,
                    bottom: nil, right: missionDetailContainer.rightAnchor,
                    centerX: nil, centerY: nil,
                    paddingTop: 10, paddingLeft: 5, paddingBottom: 0, paddingRight: 5,
                    width: 0, height: 0, xPadding: 0, yPadding: 0)
        
        patchImage
            .anchor(top: missionInfoTextView.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: missionDetailContainer.centerXAnchor, centerY: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, width: 100, height: 100, xPadding: 0, yPadding: 0)
    }
}
