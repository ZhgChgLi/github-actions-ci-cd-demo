//
//  IntegrationTests.swift
//  app-ci-cd-github-actions-demoTests
//
//  Created by harry.li on 2025/6/18.
//

@testable import app_ci_cd_github_actions_demo
import XCTest

final class IntegrationTests: XCTestCase {
    func testViewControllerNavigationFlow() throws {
        // 測試視圖控制器之間的導航流程
        let homeVC = HomeViewController()
        let profileVC = ProfileViewController()
        let settingsVC = SettingsViewController()

        // 創建導航控制器
        let navigationController = UINavigationController(rootViewController: homeVC)

        // 測試導航到個人資料頁面
        navigationController.pushViewController(profileVC, animated: false)
        XCTAssertEqual(navigationController.topViewController, profileVC)

        // 測試導航到設定頁面
        navigationController.pushViewController(settingsVC, animated: false)
        XCTAssertEqual(navigationController.topViewController, settingsVC)

        // 測試返回
        navigationController.popViewController(animated: false)
        XCTAssertEqual(navigationController.topViewController, profileVC)
    }

    func testViewControllerLifecycle() throws {
        let homeVC = HomeViewController()

        // 測試視圖生命週期
        XCTAssertNil(homeVC.view.window)

        homeVC.loadViewIfNeeded()
        XCTAssertNotNil(homeVC.view)

        // 模擬視圖即將出現
        homeVC.viewWillAppear(false)
        XCTAssertNotNil(homeVC.view)

        // 模擬視圖已出現
        homeVC.viewDidAppear(false)
        XCTAssertNotNil(homeVC.view)
    }

    func testViewControllerMemoryManagement() throws {
        weak var weakHomeVC: HomeViewController?
        weak var weakProfileVC: ProfileViewController?
        weak var weakSettingsVC: SettingsViewController?

        autoreleasepool {
            let homeVC = HomeViewController()
            let profileVC = ProfileViewController()
            let settingsVC = SettingsViewController()

            weakHomeVC = homeVC
            weakProfileVC = profileVC
            weakSettingsVC = settingsVC

            // 載入視圖
            homeVC.loadViewIfNeeded()
            profileVC.loadViewIfNeeded()
            settingsVC.loadViewIfNeeded()
        }

        // 檢查記憶體是否正確釋放
        XCTAssertNil(weakHomeVC)
        XCTAssertNil(weakProfileVC)
        XCTAssertNil(weakSettingsVC)
    }

    func testViewControllerAccessibility() throws {
        let homeVC = HomeViewController()
        let profileVC = ProfileViewController()
        let settingsVC = SettingsViewController()

        homeVC.loadViewIfNeeded()
        profileVC.loadViewIfNeeded()
        settingsVC.loadViewIfNeeded()

        // 檢查基本可訪問性設定
        XCTAssertTrue(homeVC.view.isAccessibilityElement == false)
        XCTAssertTrue(profileVC.view.isAccessibilityElement == false)
        XCTAssertTrue(settingsVC.view.isAccessibilityElement == false)
    }
}
