//
//  HomeViewControllerDelegate.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/26/22.
//

/// Provides instructions for home view controller delegate
protocol HomeControllerDelegate {
    /// Fires when the user selects a launch from the home collectionview.
    /// 
    func didSelectLaunch(launch: Launch)
}
