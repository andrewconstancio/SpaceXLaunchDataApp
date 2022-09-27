//
//  MyCell.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/22/22.
//

import UIKit
import SDWebImage

///  Home launch collection view cell for home collection view
///
class HomeLaunchCell: UICollectionViewCell {
    
    /// Launch model instance in home launch cell
    var launch: Launch? {
        didSet {

            /// mission patch string url from model
            let patchURl = launch?.links?.missionPatchSmall ?? ""
            
            /// convert mission patch string url to type URL
            let url = URL(string: patchURl)
            
            // set cell image to url image if available
            launchImage.sd_setImage(with: url) { [weak self] (image, error, cache, urls) in
                if (error != nil) {
                    //set default image if patch mission image not available
                    let origImage = UIImage(named: "rocketPlaceholder")?.withTintColor(.dynamicColor(light: .black, dark: .systemOrange))
                    self?.launchImage.image = origImage
                } else {
                    self?.launchImage.image = image
                }
            }
            
            /// Mission name info from model
            let missionName = launch?.missionName ?? ""
            
            /// Rocket name info from model
            let rocketName = launch?.rocket?.rocketName ?? ""
            
            /// Launch site name from model
            let launchSiteName = launch?.launchSite?.siteName ?? ""
            
            /// Launch date from model
            let isoDate = launch?.launchDateUTC ?? ""
            
            missionNameLabel.text = missionName
            rocketNameLabel.text = rocketName
            launchSiteNameLabel.text = "\u{2000}\(launchSiteName)"
            dateOfLaunchLabel.text = "\u{2000}\(isoDate.fromUTCToLocalDate())"
            dateOfLaunchLabel.addSystemImage(imageName: "calendar", afterLabel: false)
            launchSiteNameLabel.addSystemImage(imageName: "mappin.circle", afterLabel: false)
        }
    }
    
    /// Idendifer for cell
    static var identifier =  "launchHomeCellID"

    /// Home launch outer view
    let basicCellContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .dynamicColor(light: .white, dark: .systemGray6)
        return view
    }()
    
    /// Launch patch image view
    let launchImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    /// Mission name
    let missionNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()
    
    /// Rocket name
    let rocketNameLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.textColor = .white
        label.backgroundColor = .darkGray
        label.numberOfLines = 0
        label.paddingLeft = 8
        label.paddingTop = 7
        label.paddingRight = 8
        label.paddingBottom = 7
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    /// Launch site name
    let launchSiteNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.textColor = .systemGray
        return label
    }()
    
    /// Date of launch
    let dateOfLaunchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.textColor = .systemGray2
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //call func to set up views
        setUpViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("Interface Builder is not supported!")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        fatalError("Interface Builder is not supported!")
    }
    
    //set up views for launch home cells
    func setUpViews() {

        // add subviews
        addSubview(basicCellContainerView)
        addSubview(missionNameLabel)
        addSubview(launchSiteNameLabel)
        addSubview(dateOfLaunchLabel)
        addSubview(rocketNameLabel)
        addSubview(launchImage)
        
        //anchor sub views
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
            top: topAnchor, left: basicCellContainerView.leftAnchor,
            bottom: nil, right: nil,
            centerX: nil, centerY: nil,
            paddingTop: 30, paddingLeft: 20,
            paddingBottom: 0, paddingRight: 0,
            width: 200, height: 20,
            xPadding: 0, yPadding: 0
        )
        
        launchSiteNameLabel.anchor(
            top: missionNameLabel.bottomAnchor, left: basicCellContainerView.leftAnchor,
            bottom: nil, right: nil,
            centerX: nil, centerY: nil,
            paddingTop: 10, paddingLeft: 20,
            paddingBottom: 0, paddingRight: 0,
            width: 200, height: 20,
            xPadding: 0, yPadding: 0
        )
        
        dateOfLaunchLabel.anchor(
            top: launchSiteNameLabel.bottomAnchor, left: basicCellContainerView.leftAnchor,
            bottom: nil, right: nil,
            centerX: nil, centerY: nil,
            paddingTop: 5, paddingLeft: 20,
            paddingBottom: 0, paddingRight: 0,
            width: 200, height: 20,
            xPadding: 0, yPadding: 0
        )

        rocketNameLabel.anchor(
            top: dateOfLaunchLabel.bottomAnchor, left: basicCellContainerView.leftAnchor,
            bottom: nil, right: nil,
            centerX: nil, centerY: nil,
            paddingTop: 10, paddingLeft: 20,
            paddingBottom: 0, paddingRight: 0,
            width: 0, height: 20,
            xPadding: 0, yPadding: 0
        )
        
        launchImage.anchor(
            top: nil, left: nil,
            bottom: nil, right: basicCellContainerView.rightAnchor,
            centerX: nil, centerY: basicCellContainerView.centerYAnchor,
            paddingTop: 0, paddingLeft: 20,
            paddingBottom: 0, paddingRight: 20,
            width: 100, height: 100,
            xPadding: 0, yPadding: 0
        )
    }
}
