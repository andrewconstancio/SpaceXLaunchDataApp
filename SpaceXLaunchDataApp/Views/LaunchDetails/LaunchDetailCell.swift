//
//  LaunchDetailBodyCell.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/25/22.
//

import UIKit
import SDWebImage

///  Launch detail body collection view cell for launch details collection view
///
class LaunchDetailBodyCell: UICollectionViewCell {
    
    /// Launch model instance in launch details body cell
    var launch: Launch? {
        didSet {
            
            /// mission patch string url from model
            let patchURl = launch?.links?.missionPatchSmall ?? ""
            
            /// convert mission patch string url to type URL
            let url = URL(string: patchURl)
            
            //set cell image to url image if available
            patchImage.sd_setImage(with: url) { [weak self] (image, error, cache, urls) in
                if (error != nil) {
                    //set default image if patch mission image not available
                    let origImage = UIImage(named: "rocketPlaceholder")?.withTintColor(.dynamicColor(light: .black, dark: .systemOrange))
                    self?.patchImage.image = origImage
                } else {
                    self?.patchImage.image = image
                }
            }
            
            /// Rocket name info from model
            let rocketName = launch?.rocket?.rocketName ?? ""
            
            /// Rocket serial info from model
            let coreSerial = launch?.rocket?.firstStage?.cores?[0].coreSerial ?? ""
            
            /// Rocket core block info from model
            let coreBlock = launch?.rocket?.firstStage?.cores?[0].block ?? 0
            
            /// Rocket core flight info from model
            let coreFlight = launch?.rocket?.firstStage?.cores?[0].flight ?? 0
            
            /// Payload sub info from model
            let payLoadSubInfo = launch?.rocket?.secondStage?.payloads?[0].payloadID ?? "-"
            
            /// Payload customer info from model
            let customer = launch?.rocket?.secondStage?.payloads?[0].customers?[0] ?? "-"
            
            /// Payload type info from model
            let payloadType = launch?.rocket?.secondStage?.payloads?[0].payloadType ?? "-"
            
            /// Payload mass info from model
            let payloadMass = launch?.rocket?.secondStage?.payloads?[0].payloadMassLbs ?? 0
            
            /// Payload nationaliy info from model
            let payloadNationality = launch?.rocket?.secondStage?.payloads?[0].nationality ?? "-"
            
            /// Payload orbit info from model
            let payloadOrbit = launch?.rocket?.secondStage?.payloads?[0].orbit ?? "-"
            
            /// Mission details info from model
            let missionDetails = launch?.details ?? ""
            
            rocketNameLabel.text = rocketName
            coreInfoLabel.text = "Core\u{2000}\u{2000}Fight \(coreFlight) \u{2022} Block \(coreBlock) - \(coreSerial)"
            coreInfoLabel.halfTextColorChange(fullText: coreInfoLabel.text ?? "", changeText: "Core")
            payloadCustomerInfoLabel.text = customer
            payloadInfoSubLabel.text = payLoadSubInfo
            payloadTypeInfoLabel.text = payloadType
            payloadMassInfoLabel.text = "\(payloadMass) lbs"
            payloadNationalityInfoLabel.text = payloadNationality
            payloaOrbitInfoLabel.text = payloadOrbit
            missionInfoTextView.text = missionDetails
        }
    }
    
    /// Cell id
    static var identifer = "launchDetailBodyCell"
    
    /// Rocket info container
    let rocketInfoContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .dynamicColor(light: .white, dark: .systemGray6)
        return view
    }()
    
    /// Rocket name label
    let rocketNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()
    
    /// Core info container
    let coreContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .dynamicColor(light: .white, dark: .systemGray6)
        return view
    }()
    
    /// Core info name label
    let coreInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()
    
    /// Playload container
    let payloadContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .dynamicColor(light: .white, dark: .systemGray6)
        return view
    }()
    
    /// Playload label
    let payloadLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        label.text = "Payload"
        return label
    }()
    
    /// Payload info sub label
    let payloadInfoSubLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()
    
    /// Pay load customer label
    let payloadCustomerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        label.text = "Customer"
        return label
    }()
    
    /// Payload customer info label
    let payloadCustomerInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()
    
    /// Payload type label
    let payloadTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        label.text = "Type"
        return label
    }()
    
    /// Payload type info label
    let payloadTypeInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()
    
    /// Payload mass label
    let payloadMassLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        label.text = "Mass"
        return label
    }()

    /// Payload mass info label
    let payloadMassInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()
    
    
    /// Payload nationality label
    let payloadNationalityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        label.text = "Nationality"
        return label
    }()
    
    /// Payload nationality info label
    let payloadNationalityInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()
    
    /// Payload oribit label
    let payloadOrbitLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        label.text = "Orbit"
        return label
    }()
    
    /// Payload oribit info label
    let payloaOrbitInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        return label
    }()
    
    /// Mission details container
    let missionDetailContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .dynamicColor(light: .white, dark: .systemGray6)
        return view
    }()
    
    /// Mission details label
    let missionDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        label.text = "Mission Details"
        return label
    }()
    
    /// Mission detail info text view
    let missionInfoTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 18, weight: .light)
        textView.textColor = .dynamicColor(light: .black, dark: .white)
        textView.backgroundColor = .dynamicColor(light: .white, dark: .systemGray6)
        textView.isScrollEnabled = false
        return textView
    }()
    
    /// Mission patch image view
    let patchImage: UIImageView = {
        let imageView = UIImageView()
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
