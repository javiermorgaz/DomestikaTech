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
                self.checkModel(course: courses[0].course)
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

    private func checkModel(course: Course) {
        XCTAssertEqual(course.courseId, "387")
        XCTAssertEqual(course.thumbnail, "http://mobile-assets.domestika.org/challenge/387-original.jpg")
        XCTAssertEqual(course.title, "Introduction to Adobe Photoshop")
        XCTAssertEqual(course.trailer, "https://player.vimeo.com/external/295400375.hd.mp4?s=feac97d87265e818dfca5387a9b18d3ad7fff989&profile_id=175&oauth2_token_id=1121588336")
        XCTAssertEqual(course.description, "Learn Adobe Photoshop from scratch and master the best software for treatment, retouching and creation of digital images on the market")
        XCTAssertEqual(course.location, "Barcelona, Spain")
        XCTAssertEqual(course.teacher.name, "Carles Marsal")
        XCTAssertEqual(course.teacher.avatar, "http://mobile-assets.domestika.org/challenge/89569-original.jpg")
        XCTAssertEqual(course.reviews.positive, 4008)
        XCTAssertEqual(course.reviews.total, 4100)
        XCTAssertEqual(course.lessonsCount, 50)
        XCTAssertEqual(course.students, 161905)
        XCTAssertEqual(course.audio, "Spanish")
        XCTAssertEqual(course.subtitles[0], "English")
        XCTAssertEqual(course.level.rawValue, "Beginner")
    }
}
