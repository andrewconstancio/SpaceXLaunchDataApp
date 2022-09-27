//
//  ViewController.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/26/22.
//

import UIKit

/// A UIViewController to display the offline state
///
class NoConnectionViewController: UIViewController {
    
    /// No internet connection text label
    let noConnectionTextLabel: UILabel = {
        let label = UILabel()
        label.text = "No Internet Connection!"
        label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .dynamicColor(light: .black, dark: .white)
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    /// Sets up no internet view controller sub views
    ///
    func setupView() {
        // add subview
        view.addSubview(noConnectionTextLabel)
        
        // anchor no connection text label
        noConnectionTextLabel.anchor(
            top: nil, left: nil,
            bottom: nil, right: nil,
            centerX: view.centerXAnchor, centerY: view.centerYAnchor,
            paddingTop: 0, paddingLeft: 0,
            paddingBottom: 0, paddingRight: 0,
            width: 0, height: 0,
            xPadding: 0, yPadding: 0
        )
    }
}
