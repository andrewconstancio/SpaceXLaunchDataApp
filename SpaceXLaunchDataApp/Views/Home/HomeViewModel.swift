//
//  HomeViewModel.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/23/22.
//

import UIKit

/// A view model thats sends updates to the home view controller
///
class HomeViewModel {
    
    /// Observable object array of Launches
    var launches: Observable<[Launch]> = Observable([])
    
    var launchesFiltered: Observable<[Launch]> = Observable([])
    
    /// Loading state of home view model
    var isLoading: Observable<Bool> = Observable(true)
    
    /// Init
    init() {
        fetchData()
    }
    
    /// Fetch Space X launch data from home view model
    /// 
    private func fetchData() {
        APICaller.shared.getLaunchData { [weak self] launches, error in
            if error == nil {
                self?.launches.value = launches
                self?.isLoading.value = false
            } else {
                print(error?.localizedDescription ?? "")
            }
        }
    }
}
