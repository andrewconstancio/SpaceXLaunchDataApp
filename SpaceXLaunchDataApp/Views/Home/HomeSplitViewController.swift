//
//  SplitViewController.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/22/22.
//

import UIKit

/// A split view controller for displaying launch list data and lauch detail data
///
class HomeSplitViewController: UISplitViewController, UISplitViewControllerDelegate {
    
    /// Home controller view instance
    private var homeViewController: HomeViewController!
    
    /// Welcome home view controller instance
    private var welcomeHomeViewController: WelcomeHomeViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadViewControllers()
        splitViewController?.delegate = self
    }
    
    /// Setup split sub view controllers
    /// 
    func loadViewControllers() {
        self.homeViewController = HomeViewController()
        self.homeViewController.delegate = self
        self.welcomeHomeViewController = WelcomeHomeViewController()
        let navController = UINavigationController(rootViewController: self.homeViewController)
        self.viewControllers = [navController, self.welcomeHomeViewController]
    


        // if screen is in compact size show menu view first
        if self.traitCollection.horizontalSizeClass.rawValue == 1 {
            _ = self.viewControllers.popLast()
        }
    }
}

extension HomeSplitViewController: HomeControllerDelegate {
    /// Shows launch detail view if launch was selected function in home split view controller
    ///
    func didSelectLaunch(launch: Launch) {
        let launchVC = LaunchDetailsViewController()
        launchVC.launch = launch
        self.showDetailViewController(launchVC, sender: nil)
    }
}
