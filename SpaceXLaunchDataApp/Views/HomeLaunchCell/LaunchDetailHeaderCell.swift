//
//  LaunchDetailHeaderCollectionViewCell.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/25/22.
//

import UIKit
import YouTubeiOSPlayerHelper

class LaunchDetailHeaderCell: UICollectionViewCell {
    
    //idendifer for cell
    static var identifier =  "launchDetailHeaderID"
    
    // home launch outer view
    let basicCellContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .dynamicColor(light: .white, dark: .systemGray6)
        return view
    }()
    
    //player view
    let playerView: YTPlayerView = {
        let player = YTPlayerView()
        player.backgroundColor = .black
        player.layer.masksToBounds = true
        player.layer.cornerRadius = 20
        player.layer.zPosition = 2
        return player
    }()
    
    //mission name
    let missionNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        label.numberOfLines = 2
        label.layer.zPosition = 1
        return label
    }()
    
    //launch site name
    let launchSiteNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.layer.zPosition = 1
        return label
    }()
    
    //date of launch
    let dateOfLaunchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.textColor = .dynamicColor(light: .systemGray2, dark: .white)
        label.numberOfLines = 0
        label.layer.zPosition = 1
        return label
    }()
    
    //success name
    let successFailLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.textColor = .white
        label.numberOfLines = 0
        label.paddingLeft = 8
        label.paddingTop = 7
        label.paddingRight = 8
        label.paddingBottom = 7
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //call func to set up views
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("Interface Builder is not supported!")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        fatalError("Interface Builder is not supported!")
    }
    
}
