//
//  MyCell.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/22/22.
//

import UIKit
import SDWebImage

class LaunchHomeCell: UICollectionViewCell {
    
    //idendifer for cell
    static var identifier =  "launchHomeCellID"

    // home launch outer view
    let basicCellContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .dynamicColor(light: .white, dark: .systemGray6)
        return view
    }()
    
    // launch patch image view
    let launchImage: UIImageView = {
        let imageView = UIImageView()
        imageView.isSkeletonable = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    //mission name
    let missionNameLabel: UILabel = {
        let label = UILabel()
        label.isSkeletonable = true
        label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()
    
    //rocket name
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
    
    //launch site name
    let launchSiteNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.textColor = .systemGray
        label.isSkeletonable = true
        return label
    }()
    
    //date of launch
    let dateOfLaunchLabel: UILabel = {
        let label = UILabel()
        //label.text = "\u{2000}March 24, 2006"
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.textColor = .systemGray2
        label.isSkeletonable = true
        //label.addSystemImage(imageName: "calendar", afterLabel: false)
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
    
}

