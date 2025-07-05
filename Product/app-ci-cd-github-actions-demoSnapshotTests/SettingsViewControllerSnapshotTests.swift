//
//  SettingsViewControllerSnapshotTests.swift
//  app-ci-cd-github-actions-demoTests
//
//  Created by harry.li on 2025/6/18.
//

@testable import app_ci_cd_github_actions_demo
import SnapshotTesting
import XCTest

// Record as iPhone 16 Pro 18.3.1
final class SettingsViewControllerSnapshotTests: XCTestCase {
    var settingsViewController: SettingsViewController!

    override func setUpWithError() throws {
        isRecording = false
        settingsViewController = SettingsViewController()
    }

    override func tearDownWithError() throws {
        settingsViewController = nil
    }

    func testSettingsViewControllerDefaultLayout() throws {
        // 設定視圖大小
        settingsViewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)

        // 載入視圖
        settingsViewController.loadViewIfNeeded()

        // 執行 snapshot 測試
        assertSnapshot(of: settingsViewController, as: .image, named: "SettingsViewController_Default")
    }

    func testSettingsViewControllerDarkMode() throws {
        // 設定視圖大小
        settingsViewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)

        // 設定深色模式
        settingsViewController.overrideUserInterfaceStyle = .dark

        // 載入視圖
        settingsViewController.loadViewIfNeeded()

        // 執行 snapshot 測試
        assertSnapshot(of: settingsViewController, as: .image, named: "SettingsViewController_DarkMode")
    }

    func testSettingsViewControllerLandscape() throws {
        // 設定橫向視圖大小
        settingsViewController.view.frame = CGRect(x: 0, y: 0, width: 812, height: 375)

        // 載入視圖
        settingsViewController.loadViewIfNeeded()

        // 執行 snapshot 測試
        assertSnapshot(of: settingsViewController, as: .image, named: "SettingsViewController_Landscape")
    }

    func testSettingsViewControlleriPad() throws {
        // 設定 iPad 視圖大小
        settingsViewController.view.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)

        // 載入視圖
        settingsViewController.loadViewIfNeeded()

        // 執行 snapshot 測試
        assertSnapshot(of: settingsViewController, as: .image, named: "SettingsViewController_iPad")
    }

    func testSettingsViewControllerWithNavigationBar() throws {
        // 設定視圖大小
        settingsViewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)

        // 創建導航控制器
        let navigationController = UINavigationController(rootViewController: settingsViewController)
        navigationController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)

        // 載入視圖
        navigationController.loadViewIfNeeded()

        // 執行 snapshot 測試
        assertSnapshot(of: navigationController, as: .image, named: "SettingsViewController_WithNavigationBar")
    }

    func testSettingsViewControllerOnSpecificDevice() throws {
        // 載入視圖
        settingsViewController.loadViewIfNeeded()

        // 使用特定裝置的 snapshot 策略
        assertSnapshot(of: settingsViewController, as: .image(on: .iPhoneSe), named: "SettingsViewController_iPhoneSE")
        assertSnapshot(of: settingsViewController, as: .image(on: .iPhoneX), named: "SettingsViewController_iPhoneX")
    }

    func testSettingsViewControllerRecursiveDescription() throws {
        // 載入視圖
        settingsViewController.loadViewIfNeeded()

        // 測試遞迴描述（視圖層次結構）
        assertSnapshot(of: settingsViewController, as: .recursiveDescription, named: "SettingsViewController_RecursiveDescription")
    }
}
