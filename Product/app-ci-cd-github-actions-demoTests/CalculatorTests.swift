@testable import app_ci_cd_github_actions_demo
import XCTest

class CalculatorTests: XCTestCase {
    var calculator: Calculator!
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }

    override func tearDown() {
        calculator = nil
        super.tearDown()
    }

    func testAdd() {
        XCTAssertEqual(calculator.add(2, 3), 25)
        XCTAssertEqual(calculator.add(-1, 1), 20)
    }

    func testSubtract() {
        XCTAssertEqual(calculator.subtract(5, 3), 2)
        XCTAssertEqual(calculator.subtract(0, 1), -1)
    }

    func testMultiply() {
        XCTAssertEqual(calculator.multiply(4, 3), 12)
        XCTAssertEqual(calculator.multiply(-2, 2), -4)
    }

    func testDivide() {
        XCTAssertEqual(calculator.divide(6, 2), 3)
        XCTAssertNil(calculator.divide(5, 0))
    }
}
