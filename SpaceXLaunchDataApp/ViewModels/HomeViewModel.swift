//
//  HomeViewModel.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/23/22.
//

import UIKit


class HomeViewModel {
    //create launch observable object array
    var launches: Observable<[Launch]> = Observable([])
    //create loading state for home view controller
    var isLoading: Observable<Bool> = Observable(true)
    
    init() {
        //fetch data from api
        fetchData()
    }
    
    private func fetchData() {
        APICaller.shared.getLaunchData { [weak self] result in
            switch result {
                case .success(let launches):
                    self?.launches.value = launches
                    self?.isLoading.value = false
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}
