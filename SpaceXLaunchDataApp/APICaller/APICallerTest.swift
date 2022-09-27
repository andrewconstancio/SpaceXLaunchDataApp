//
//  APICallerTest.swift
//  SpaceXLaunchDataAppTests
//
//  Created by Andrew Constancio on 9/27/22.
//

import XCTest

import SDWebImage
@testable import SpaceXLaunchDataApp

class APICallerTest: XCTestCase {
    let spaceXClient = MockSpaceXApiClient()

    func testFetchSpaceXDataAPICall() {
        // Force error to be thrown
        spaceXClient.shouldReturnError = true
        spaceXClient.getLaunchData() { launchArray, error in
            if let error = error {
                XCTAssertNotNil(error.localizedDescription)
            }
        }
    }
}

class MockSpaceXApiClient {
    var shouldReturnError = false
    var requestSpaceXData = false
    
    enum MockServiceError: Error {
        case getLaunchData
    }
    
    func reset() {
        shouldReturnError = false
        requestSpaceXData = false
    }
    
    convenience init() {
        self.init(false)
    }
    
    init(_ shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
}

extension MockSpaceXApiClient: APICallerProtocol {
    func getLaunchData(completion: @escaping ([SpaceXLaunchDataApp.Launch]?, Error?) -> Void) {
        if shouldReturnError {
            completion(nil, MockServiceError.getLaunchData)
        }
    }
}
