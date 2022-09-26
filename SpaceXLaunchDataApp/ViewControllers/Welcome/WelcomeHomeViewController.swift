//
//  WelcomeHomeViewController.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/26/22.
//

import UIKit

class WelcomeHomeViewController: UIViewController {
    
    let welcomeHomeTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Space X launches"
        label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.addSubview(welcomeHomeTextLabel)
        welcomeHomeTextLabel
            .anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: view.centerXAnchor, centerY: view.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, xPadding: 0, yPadding: 0)
    }
    
}
