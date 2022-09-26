//
//  LaunchDetailBodyCell.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/25/22.
//

import UIKit

class LaunchDetailBodyCell: UICollectionViewCell {
    
    static var identifer = "launchDetailBodyCell"
    
    // rocket info container
    let rocketInfoContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .dynamicColor(light: .white, dark: .systemGray6)
        return view
    }()
    
    //rocket name label
    let rocketNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()
    
    //core info container
    let coreContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .dynamicColor(light: .white, dark: .systemGray6)
        return view
    }()
    
    //core info name label
    let coreInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()
    
    //playload container
    let payloadContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .dynamicColor(light: .white, dark: .systemGray6)
        return view
    }()
    
    //playload label
    let payloadLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        label.text = "Payload"
        return label
    }()
    
    //payload info sub label
    let payloadInfoSubLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()
    
    //pay load customer label
    let payloadCustomerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        label.text = "Customer"
        return label
    }()
    
    //payload customer info label
    let payloadCustomerInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()
    
    //payload type label
    let payloadTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        label.text = "Type"
        return label
    }()
    
    //payload type info label
    let payloadTypeInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()
    
    //payload mass label
    let payloadMassLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        label.text = "Mass"
        return label
    }()

    //payload mass info label
    let payloadMassInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()
    
    
    //payload nationality label
    let payloadNationalityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        label.text = "Nationality"
        return label
    }()
    
    //payload nationality info label
    let payloadNationalityInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()
    
    //payload oribit label
    let payloadOrbitLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        label.text = "Orbit"
        return label
    }()
    
    //payload oribit info label
    let payloaOrbitInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()
    
    //mission detail container
    let missionDetailContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .dynamicColor(light: .white, dark: .systemGray6)
        return view
    }()
    
    //mission detail label
    let missionDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        label.text = "Mission Details"
        return label
    }()
    
    //mission detail info text view
    let missionInfoTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 18, weight: .light)
        textView.textColor = .dynamicColor(light: .black, dark: .white)
        textView.backgroundColor = .dynamicColor(light: .white, dark: .systemGray6)
        textView.isScrollEnabled = false
        return textView
    }()
    
    // patch image view
    let patchImage: UIImageView = {
        let imageView = UIImageView()
        imageView.isSkeletonable = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //call func to set up views
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
