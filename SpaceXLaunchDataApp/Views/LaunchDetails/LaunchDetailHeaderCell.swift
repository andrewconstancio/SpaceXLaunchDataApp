//
//  LaunchDetailHeaderCollectionViewCell.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/25/22.
//

import UIKit
import YouTubeiOSPlayerHelper

///  Launch detail header collection view cell for launch details collection view
///
class LaunchDetailHeaderCell: UICollectionViewCell {
    
    /// Launch model instance in launch details header cell
    var launch: Launch? {
        didSet {
            let isoDate = launch?.launchDateUTC ?? ""
            let siteName = launch?.launchSite?.siteName ?? ""
            missionNameLabel.text = launch?.missionName
            launchSiteNameLabel.text = "\u{2000}\(siteName)"
            dateOfLaunchLabel.text = "\u{2000}\(isoDate.fromUTCToLocalDate())"
            dateOfLaunchLabel.addSystemImage(imageName: "calendar", afterLabel: false)

            // check if mission was a success
            let successOfLaunch  = launch?.launchSuccess ?? false
            if successOfLaunch {
                successFailLabel.text = "Success"
                successFailLabel.backgroundColor = .systemGreen
            } else {
                successFailLabel.text = "Fail"
                successFailLabel.backgroundColor = .systemRed
            }
            // load video player with youtube video
            DispatchQueue.main.async {
                self.playerView.load(withVideoId: self.launch?.links?.youtubeID ?? "")
            }
        }
    }
    
    /// Idendifer for cell
    static var identifier =  "launchDetailHeaderID"
    
    ///  Home launch outer view
    let basicCellContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .dynamicColor(light: .white, dark: .systemGray6)
        return view
    }()
    
    /// Youtube video of launch player view
    let playerView: YTPlayerView = {
        let player = YTPlayerView()
        player.backgroundColor = .black
        player.layer.masksToBounds = true
        player.layer.cornerRadius = 20
        player.layer.zPosition = 2
        return player
    }()
    
    /// Mission name label
    let missionNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        label.numberOfLines = 2
        label.layer.zPosition = 1
        return label
    }()
    
    /// Launch site name label
    let launchSiteNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.layer.zPosition = 1
        return label
    }()
    
    /// Date of launch label
    let dateOfLaunchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.textColor = .dynamicColor(light: .systemGray2, dark: .white)
        label.numberOfLines = 0
        label.layer.zPosition = 1
        return label
    }()
    
    /// Success /  Fail of launch label
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
    
    /// Set up launch details header sub views
    /// 
    func setupViews() {

        //add subviews
        addSubview(basicCellContainerView)
        addSubview(missionNameLabel)
        addSubview(dateOfLaunchLabel)
        addSubview(playerView)
        addSubview(successFailLabel)
        
        //anchor subviews
        basicCellContainerView.anchor(
            top: topAnchor, left: leftAnchor,
            bottom: bottomAnchor, right: rightAnchor,
            centerX: nil, centerY: nil,
            paddingTop: 0, paddingLeft: 0,
            paddingBottom: 0, paddingRight: 0,
            width: 0, height: 0,
            xPadding: 0, yPadding: 0
        )
        
        missionNameLabel.anchor(
            top: basicCellContainerView.topAnchor, left: basicCellContainerView.leftAnchor,
            bottom: nil, right: basicCellContainerView.rightAnchor,
            centerX: nil, centerY: nil,
            paddingTop: 50, paddingLeft: 15,
            paddingBottom: 0, paddingRight: 0,
            width: 0, height: 0,
            xPadding: 0, yPadding: 0
        )

        dateOfLaunchLabel.anchor(
            top: missionNameLabel.bottomAnchor, left: basicCellContainerView.leftAnchor,
            bottom: nil, right: nil,
            centerX: nil, centerY: nil,
            paddingTop: 5, paddingLeft: 15,
            paddingBottom: 0, paddingRight: 0,
            width: 0, height: 0,
            xPadding: 0, yPadding: 0
        )
        
        playerView.anchor(
            top: dateOfLaunchLabel.bottomAnchor, left: basicCellContainerView.leftAnchor,
            bottom: nil, right: basicCellContainerView.rightAnchor,
            centerX: nil, centerY: nil,
            paddingTop: 20, paddingLeft: 15,
            paddingBottom: 0, paddingRight: 15,
            width: 0, height: 250,
            xPadding: 0, yPadding: 0
        )
        
        successFailLabel.anchor(
            top: playerView.bottomAnchor, left: basicCellContainerView.leftAnchor,
            bottom: nil, right: nil,
            centerX: nil, centerY: nil,
            paddingTop: 15, paddingLeft: 20,
            paddingBottom: 10, paddingRight: 0,
            width: 0, height: 0,
            xPadding: 0, yPadding: 0
        )
    }
}
