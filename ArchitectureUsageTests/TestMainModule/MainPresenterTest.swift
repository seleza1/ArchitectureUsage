//
//  MainPresenterTest.swift
//  ArchitectureUsageTests
//
//  Created by user on 06.03.2023.
//

import XCTest
@testable import ArchitectureUsage

class MockView: MainViewProtocol {
    var titleTest: String?
    func setGreeting(greeting: String) {
        titleTest = greeting
    }
}

final class MainPresenterTest: XCTestCase {
    var view: MockView!
    var person: Person!
    var presenter: MainPresenter!

    override func setUpWithError() throws {
        view = MockView()
        person = Person(firstName: "Baz", lastName: "Bar")
        presenter = MainPresenter(view: view, person: person)
    }

    override func tearDownWithError() throws {
        view = nil
        person = nil
        presenter = nil
    }

    func testModuleNotNil() {
        XCTAssertNotNil(view, "view is not nil")
    }
}
