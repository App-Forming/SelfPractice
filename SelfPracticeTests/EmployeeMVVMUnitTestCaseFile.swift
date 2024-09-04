//
//  EmployeeMVVMUnitTestCaseFile.swift
//  SelfPracticeTests
//
//  Created by Lingam on 04/09/24.
//

import Foundation
import XCTest
@testable import SelfPractice


class EmployeeViewModelMVVMTests: XCTestCase {
    
    var viewModel: EmployeeViewModel!
    
    override func setUpWithError() throws {
        viewModel = EmployeeViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testFetchEmployeesSuccess() {
          // Arrange
          let expectation = self.expectation(description: "Employees fetched successfully")
          
          // Act
          viewModel.fetchEmployees {
              // Assert
              XCTAssertGreaterThan(self.viewModel.employees.count, 0)
              expectation.fulfill()
          }
          
          waitForExpectations(timeout: 5,handler: nil)
      }
    
  

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
}
