//
//  WelcomeHomeViewController.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/26/22.
//

import UIKit


/// A UIViewController for welcome screen on large devies
///
class WelcomeHomeViewController: UIViewController {
    
    ///  Welcome to Space X Launches ui label
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
        // set up sub views
        setupView()
    }
    
    /// Sets up welcome home view controller sub views
    ///
    func setupView() {
        // add subview
        view.addSubview(welcomeHomeTextLabel)
        
        // anchor welcome home text label
        welcomeHomeTextLabel
            .anchor(
                top: nil,
                left: nil,
                bottom: nil,
                right: nil,
                centerX: view.centerXAnchor,
                centerY: view.centerYAnchor,
                paddingTop: 0,
                paddingLeft: 0,
                paddingBottom: 0,
                paddingRight: 0,
                width: 0,
                height: 0,
                xPadding: 0,
                yPadding: 0
            )
    }
}
