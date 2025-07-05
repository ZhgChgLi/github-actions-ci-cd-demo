//
//  ProfileViewControllerSnapshotTests.swift
//  app-ci-cd-github-actions-demoTests
//
//  Created by harry.li on 2025/6/18.
//

@testable import app_ci_cd_github_actions_demo
import SnapshotTesting
import XCTest

// Record as iPhone 16 18.4
final class ProfileViewControllerSnapshotTests: XCTestCase {
    var profileViewController: ProfileViewController!

    override func setUpWithError() throws {
        isRecording = false
        profileViewController = ProfileViewController()
    }

    override func tearDownWithError() throws {
        profileViewController = nil
    }

    func testProfileViewControllerDefaultLayout() throws {
        // 設定視圖大小
        profileViewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812) // iPhone 12 Pro 尺寸

        // 載入視圖
        profileViewController.loadViewIfNeeded()

        // 執行 snapshot 測試
        assertSnapshot(of: profileViewController, as: .image, named: "ProfileViewController_Default")
    }

    func testProfileViewControllerDarkMode() throws {
        // 設定視圖大小
        profileViewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)

        // 設定深色模式
        profileViewController.overrideUserInterfaceStyle = .dark

        // 載入視圖
        profileViewController.loadViewIfNeeded()

        // 執行 snapshot 測試
        assertSnapshot(of: profileViewController, as: .image, named: "ProfileViewController_DarkMode")
    }

    func testProfileViewControllerLandscape() throws {
        // 設定橫向視圖大小
        profileViewController.view.frame = CGRect(x: 0, y: 0, width: 812, height: 375)

        // 載入視圖
        profileViewController.loadViewIfNeeded()

        // 執行 snapshot 測試
        assertSnapshot(of: profileViewController, as: .image, named: "ProfileViewController_Landscape")
    }

    func testProfileViewControlleriPad() throws {
        // 設定 iPad 視圖大小
        profileViewController.view.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)

        // 載入視圖
        profileViewController.loadViewIfNeeded()

        // 執行 snapshot 測試
        assertSnapshot(of: profileViewController, as: .image, named: "ProfileViewController_iPad")
    }

    func testProfileViewControllerOnSpecificDevice() throws {
        // 載入視圖
        profileViewController.loadViewIfNeeded()

        // 使用特定裝置的 snapshot 策略
        assertSnapshot(of: profileViewController, as: .image(on: .iPhoneSe), named: "ProfileViewController_iPhoneSE")
        assertSnapshot(of: profileViewController, as: .image(on: .iPhoneX), named: "ProfileViewController_iPhoneX")
    }

    func testProfileViewControllerRecursiveDescription() throws {
        // 載入視圖
        profileViewController.loadViewIfNeeded()

        // 測試遞迴描述（視圖層次結構）
        assertSnapshot(of: profileViewController, as: .recursiveDescription, named: "ProfileViewController_RecursiveDescription")
    }
}
