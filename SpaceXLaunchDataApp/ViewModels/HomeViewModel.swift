//
//  HomeViewModel.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/23/22.
//

import UIKit


class HomeViewModel {
    var launches: Observable<[Launch]> = Observable([])
    var isLoading: Observable<Bool> = Observable(true)
    
    init() {
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
