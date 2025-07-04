import XCTest
@testable import app_ci_cd_github_actions_demo

class StringValidatorTests: XCTestCase {
    var validator: StringValidator!
    override func setUp() {
        super.setUp()
        validator = StringValidator()
    }
    override func tearDown() {
        validator = nil
        super.tearDown()
    }
    func testIsEmail() {
        XCTAssertTrue(validator.isEmail("test@example.com"))
        XCTAssertFalse(validator.isEmail("not-an-email"))
    }
    func testIsPhoneNumber() {
        XCTAssertTrue(validator.isPhoneNumber("0912345678"))
        XCTAssertFalse(validator.isPhoneNumber("1234567890"))
    }
    func testIsEmpty() {
        XCTAssertTrue(validator.isEmpty("   "))
        XCTAssertFalse(validator.isEmpty("abc"))
    }
} 