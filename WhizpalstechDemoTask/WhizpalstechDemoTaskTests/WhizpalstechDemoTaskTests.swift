//
//  WhizpalstechDemoTaskTests.swift
//  WhizpalstechDemoTaskTests
//
//  Created by Jay Ghervada on 30/12/25.
//

import XCTest
@testable import WhizpalstechDemoTask

final class WhizpalstechDemoTaskTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchUserDetailModels_Failure() async throws {
        // Arrange
        let mockService = MockNetworkService()
        mockService.shouldThrowError = true
        let viewModel = UserDetailsViewModel(networkService: mockService)
        
        // Act
        await viewModel.fetchUserDetailModels()
        
        // Assert
        XCTAssertTrue(viewModel.modelList.isEmpty)
    }

}
