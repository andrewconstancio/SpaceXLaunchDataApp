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

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getLaunchData(completion: @escaping(Result<[Launch], Error>) -> Void) {
        guard let url = URL(string: Constants.spaceXLaunchDataURL) else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode([Launch].self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
}


