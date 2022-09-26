//
//  SplitViewController.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/22/22.
//

import UIKit

class HomeSplitViewController: UISplitViewController, HomeViewControllerDelegate, UISplitViewControllerDelegate {
    
    private var homeViewController: HomeViewController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadViewControllers()
        splitViewController?.delegate = self
        //self.preferredDisplayMode = .oneOverSecondary
    }
    
    func didSelectLaunch(launch: Launch) {
        let launchVC = LaunchViewController()
        launchVC.launch = launch
        self.showDetailViewController(launchVC, sender: nil)
    }
    
    func loadViewControllers() {
        self.homeViewController = HomeViewController()
        self.homeViewController.delegate = self
        let navController = UINavigationController(rootViewController: self.homeViewController)
        let detail = LaunchViewController()
        self.viewControllers = [navController, detail]

        // if screen is in compact size show menu view first
        if self.traitCollection.horizontalSizeClass.rawValue == 1 {
            _ = self.viewControllers.popLast()
        }
    }
}
