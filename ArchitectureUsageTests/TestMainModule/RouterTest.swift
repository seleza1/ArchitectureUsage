//
//  RouterTest.swift
//  ArchitectureUsageTests
//
//  Created by user on 07.03.2023.
//

import XCTest
@testable import ArchitectureUsage

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    var popVC: UIViewController?

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }

    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        let main = MainViewController()
        self.popVC = main
        return super.popToRootViewController(animated: animated)
    }


}

final class RouterTest: XCTestCase {

    var router: RouterProtocol!
    let assembly = ModelBuilder()
    var navigationController = MockNavigationController()

    override func setUpWithError() throws {
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        router = nil

    }

    func testRouter() {
        router.showDetail(comments: nil)
        let detailsVC = navigationController.presentedVC
        XCTAssertTrue(detailsVC is DetailViewController)
    }

    func testRouterRoot() {
        router.popToRoot()
        let rootVC = navigationController.popVC
        XCTAssertTrue(rootVC is MainViewController)
    }



}
