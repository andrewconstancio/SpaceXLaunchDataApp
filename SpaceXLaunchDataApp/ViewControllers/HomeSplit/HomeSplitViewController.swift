//
//  SplitViewController.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/22/22.
//

import UIKit

class HomeSplitViewController: UISplitViewController, HomeViewControllerDelegate, UISplitViewControllerDelegate {
    
    // create home controller type var
    private var homeViewController: HomeViewController!
    private var welcomeHomeViewController: WelcomeHomeViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up split view controller
        self.loadViewControllers()
        
        //assign split controller delegate to self
        splitViewController?.delegate = self
    }
    
    // if launch selected show launch detail view controller
    func didSelectLaunch(launch: Launch) {
        let launchVC = LaunchViewController()
        launchVC.launch = launch
        self.showDetailViewController(launchVC, sender: nil)
    }
    
    // setup view controllers func
    func loadViewControllers() {
        self.homeViewController = HomeViewController()
        self.homeViewController.delegate = self
        self.welcomeHomeViewController = WelcomeHomeViewController()
        let navController = UINavigationController(rootViewController: self.homeViewController)
        
        //let detail = LaunchViewController()
        self.viewControllers = [navController, self.welcomeHomeViewController]

        // if screen is in compact size show menu view first
        if self.traitCollection.horizontalSizeClass.rawValue == 1 {
            _ = self.viewControllers.popLast()
        }
    }
}
