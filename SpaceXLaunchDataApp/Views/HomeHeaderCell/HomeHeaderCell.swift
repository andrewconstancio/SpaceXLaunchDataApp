//
//  homeHeaderViewCell.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/22/22.
//

import UIKit

class HomeHeaderCell: UICollectionViewCell {
    
    //spaceX label
    let spaceXLabel: UILabel = {
        let label = UILabel()
        label.text = "Space X"
        label.font = UIFont.systemFont(ofSize: 36, weight: .black)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()

    // launch label
    let launchLabel: UILabel = {
        let label = UILabel()
        label.text = "Launches"
        label.font = UIFont.systemFont(ofSize: 32, weight: .black)
        label.textColor = .systemIndigo
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //call func to set up views
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

