//
//  HomeTests.swift
//  SpaceXLaunchDataAppTests
//
//  Created by Andrew Constancio on 9/27/22.
//

import XCTest

@testable import SpaceXLaunchDataApp

class HomeTests: XCTestCase {
    var subject: HomeViewController!
    
    override func setUp() {
        super.setUp()
        subject = HomeViewController()
    }
    
    func testViewDidAppear() {
        subject.viewDidLoad()
        
        XCTAssertTrue(subject.view.contains(subject.homeCollectionView))
        XCTAssertEqual(subject.title, "Space X Launches")
    }
    
    func testHomeViewModel() {
        subject.viewDidLoad()
        
        self.subject.homeViewModel.isLoading.bind { loading in
            XCTAssertTrue(loading!)
        }
    }
}
