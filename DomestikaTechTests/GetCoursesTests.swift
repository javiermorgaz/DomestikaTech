//
//  GetCoursesTests.swift
//  DomestikaTechTests
//
//  Created by Jmorgaz on 11/08/2020.
//

import XCTest
import Foundation
import Combine
import OHHTTPStubs
@testable import DomestikaTech

class GetCoursesTests: XCTestCase {

    private var restClient: RestClient!
    private var getCoursesUseCase: GetCourses!
    private var asyncExpectation: XCTestExpectation!
    
    private var cancellable = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        getCoursesUseCase = AppServiceLocator.shared.core.discover.provideGetCoursesUseCase()
    }

    override func tearDownWithError() throws {
        HTTPStubs.removeAllStubs()
        cancellable.removeAll()
    }

    func test_getCourses_ok() throws {
        stub(condition: isHost("mobile-assets.domestika.org")) { _ in
          let stubPath = OHPathForFile("home.json", type(of: self))
          return fixture(filePath: stubPath!, headers: ["Content-Type": "application/json"])
        }

        //Given
        asyncExpectation = expectation(description: "\(#function)")

        //When
        getCoursesUseCase.exec()
            .receive(on: DispatchQueue.main)
            .map { courses in courses.map { CourseItemViewModel(course: $0) }}
            .sink(receiveCompletion: { error in
                //Then
                switch error {
                case .finished:
                    break
                case .failure:
                    XCTAssert(false)
                    self.asyncExpectation.fulfill()
                }
            }, receiveValue: { courses in
                //Then
                XCTAssert(!courses.isEmpty)
                self.asyncExpectation.fulfill()
            })
            .store(in: &cancellable)

        waitForExpectations(timeout: 1, handler: nil)
    }

    func test_getCourses_invalid_json() throws {
        stub(condition: isHost("mobile-assets.domestika.org")) { _ in
          let stubPath = OHPathForFile("home_bad_structure.json", type(of: self))
          return fixture(filePath: stubPath!, headers: ["Content-Type": "application/json"])
        }

        //Given
        asyncExpectation = expectation(description: "\(#function)")

        //When
        getCoursesUseCase.exec()
            .receive(on: DispatchQueue.main)
            .map { courses in courses.map { CourseItemViewModel(course: $0) }}
            .sink(receiveCompletion: { error in
                //Then
                switch error {
                case .finished:
                    break
                case .failure:
                    XCTAssert(true)
                    self.asyncExpectation.fulfill()
                }
            }, receiveValue: { _ in
                //Then
                XCTAssert(false)
                self.asyncExpectation.fulfill()
            })
            .store(in: &cancellable)

        waitForExpectations(timeout: 1, handler: nil)
    }
}
