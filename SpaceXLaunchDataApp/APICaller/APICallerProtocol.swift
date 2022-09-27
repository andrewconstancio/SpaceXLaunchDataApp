//
//  APICalllerProtocol.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/27/22.
//

import Foundation

protocol APICallerProtocol {
    func getLaunchData(completion: @escaping([Launch]?, Error?) -> Void)
}
