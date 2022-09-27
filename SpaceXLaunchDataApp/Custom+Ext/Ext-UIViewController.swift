//
//  Ext-UIViewController.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/24/22.
//

import UIKit

/// Creates a spinner `UIVIew`
var vSpinner: UIView?

extension UIViewController {
    /// Applys a `vSpinner` animation view to the given UIView
    ///
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.1)
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    /// Removes `vSpinner` from current view
    ///
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
