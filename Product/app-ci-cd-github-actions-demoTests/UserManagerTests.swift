import XCTest
@testable import app_ci_cd_github_actions_demo

class UserManagerTests: XCTestCase {
    var userManager: UserManager!
    override func setUp() {
        super.setUp()
        userManager = UserManager()
    }
    override func tearDown() {
        userManager = nil
        super.tearDown()
    }
    func testLoginSuccess() {
        XCTAssertTrue(userManager.login(username: "test", password: "1234"))
        XCTAssertTrue(userManager.isLoggedIn())
    }
    func testLoginFailure() {
        XCTAssertFalse(userManager.login(username: "wrong", password: "user"))
        XCTAssertFalse(userManager.isLoggedIn())
    }
    func testLogout() {
        _ = userManager.login(username: "test", password: "1234")
        userManager.logout()
        XCTAssertFalse(userManager.isLoggedIn())
    }
} 