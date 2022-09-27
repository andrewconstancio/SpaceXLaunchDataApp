//
//  APICaller.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/23/22.
//
import UIKit

struct Constants {
    static let spaceXLaunchDataURL = "https://api.spacexdata.com/v3/launches?order=desc"
}

/// API  error enum
enum APIError: Error {
    case failedToGetData
}

class APICaller: APICallerProtocol {
    /// Shares instance of  APICaller
    static let shared = APICaller()
    
    /// Get the data from space x api and stores data in the launch model
    func getLaunchData(completion: @escaping([Launch]?, Error?) -> Void) {
        guard let url = URL(string: Constants.spaceXLaunchDataURL) else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode([Launch].self, from: data)
                completion(results, nil)
            } catch {
                completion(nil, APIError.failedToGetData)
            }
        }
        task.resume()
    }
}


