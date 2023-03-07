//
//  MainPresenterTest.swift
//  ArchitectureUsageTests
//
//  Created by user on 06.03.2023.
//

import XCTest
@testable import ArchitectureUsage

class MockView: MainViewProtocol {
    func succes() {
    }

    func failure(error: Error) {
    }
}

class MockNetworkService: NetworkServiceProtocol {
    var comments: [Comment]!
    init() {}

    convenience init(comments: [Comment]?) {
        self.init()
        self.comments = comments
    }

    func getComments(completion: @escaping (Result<[ArchitectureUsage.Comment], ArchitectureUsage.NetworkError>) -> Void) {
        if let comments = comments {
            completion(.success(comments))
        } else {
            let error = NSError(domain: "", code: 0, userInfo: nil)
            completion(.failure(error as! NetworkError))

        }
    }
}

final class MainPresenterTest: XCTestCase {
    var view: MockView!
    var presenter: MainPresenter!
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol!
    var comments = [Comment]()
    let navigationController = UINavigationController()
    let builder = ModelBuilder()

    override func setUpWithError() throws {

        router = Router(navigationController: navigationController, assemblyBuilder: builder)

    }

    override func tearDown() {
        view = nil
        networkService = nil
        presenter = nil
    }

    func testGetSuccesComments() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Bar", body: "Baz")
        comments.append(comment)
        view = MockView()
        networkService = MockNetworkService(comments: [comment])
        presenter = MainPresenter(view: view, networkService: networkService, router: router)

        var catchComments: [Comment]?

        networkService.getComments { result in
            switch result {
            case .success(let comments):
                catchComments = comments
            case .failure(let error):
                print(error)
            }
        }
        XCTAssertNotEqual(catchComments?.count, 0)

    }
}
