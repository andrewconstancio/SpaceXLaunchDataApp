//
//  homeHeaderViewCell.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/22/22.
//

import UIKit

///  Home header collection view cell for home collection view
///
class HomeHeaderCell: UICollectionViewCell, UISearchBarDelegate {
    
    /// SpaceX label
    let spaceXLabel: UILabel = {
        let label = UILabel()
        label.text = "Space X"
        label.font = UIFont.systemFont(ofSize: 36, weight: .black)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()

    /// Launch label
    let launchLabel: UILabel = {
        let label = UILabel()
        label.text = "Launches"
        label.font = UIFont.systemFont(ofSize: 32, weight: .black)
        label.textColor = .systemIndigo
        return label
    }()
    
    let searchBar : UISearchBar = {
        let search = UISearchBar()
        return search
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Set up views for home header cell
    ///
    func setUpViews(){
        
        // add sub views
        addSubview(launchLabel)
        addSubview(spaceXLabel)
//        addSubview(searchBar)
        
        // Anchor launch text label
        launchLabel.anchor(
            top: nil, left: leftAnchor,
            bottom: bottomAnchor, right: nil,
            centerX: nil, centerY: nil,
            paddingTop: 0, paddingLeft: 10,
            paddingBottom: 20, paddingRight: 0,
            width: 0, height: 0,
            xPadding: 0, yPadding: 0
        )
        
        // Anchor spaceX label
        spaceXLabel.anchor(
            top: nil, left: leftAnchor,
            bottom: launchLabel.topAnchor, right: nil,
            centerX: nil, centerY: nil,
            paddingTop: 0, paddingLeft: 10,
            paddingBottom: -5, paddingRight: 0,
            width: 0, height: 0,
            xPadding: 0, yPadding: 0
        )
            
        // Anchor search bar
//        searchBar.anchor(
//            top: launchLabel.bottomAnchor, left: leftAnchor,
//            bottom: nil, right: rightAnchor,
//            centerX: nil, centerY: nil,
//            paddingTop: 0, paddingLeft: 0,
//            paddingBottom: 5, paddingRight: 0,
//            width: 0, height: 0,
//            xPadding: 0, yPadding: 0
//        )
    }
}

