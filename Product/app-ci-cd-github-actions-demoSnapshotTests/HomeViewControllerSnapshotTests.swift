//
//  HomeViewControllerSnapshotTests.swift
//  app-ci-cd-github-actions-demoTests
//
//  Created by harry.li on 2025/6/18.
//

@testable import app_ci_cd_github_actions_demo
import SnapshotTesting
import XCTest

// Record as iPhone 16 18.4
final class HomeViewControllerSnapshotTests: XCTestCase {
    var homeViewController: HomeViewController!

    override func setUpWithError() throws {
        isRecording = false
        homeViewController = HomeViewController()
        homeViewController.overrideUserInterfaceStyle = .light
    }

    override func tearDownWithError() throws {
        homeViewController = nil
    }

    func testHomeViewControllerDefaultLayout() throws {
        // 設定視圖大小
        homeViewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)

        // 載入視圖
        homeViewController.loadViewIfNeeded()

        // 執行 snapshot 測試
        assertSnapshot(of: homeViewController, as: .image, named: "HomeViewController_Default")
    }

    func testHomeViewControllerDarkMode() throws {
        // 設定視圖大小
        homeViewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)

        // 設定深色模式
        homeViewController.overrideUserInterfaceStyle = .dark

        // 載入視圖
        homeViewController.loadViewIfNeeded()

        // 執行 snapshot 測試
        assertSnapshot(of: homeViewController, as: .image, named: "HomeViewController_DarkMode")
    }

    func testHomeViewControllerLandscape() throws {
        // 設定橫向視圖大小
        homeViewController.view.frame = CGRect(x: 0, y: 0, width: 812, height: 375)

        // 載入視圖
        homeViewController.loadViewIfNeeded()

        // 執行 snapshot 測試
        assertSnapshot(of: homeViewController, as: .image, named: "HomeViewController_Landscape")
    }

    func testHomeViewControlleriPad() throws {
        // 設定 iPad 視圖大小
        homeViewController.view.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)

        // 載入視圖
        homeViewController.loadViewIfNeeded()

        // 執行 snapshot 測試
        assertSnapshot(of: homeViewController, as: .image, named: "HomeViewController_iPad")
    }

    func testHomeViewControllerWithNavigationBar() throws {
        // 設定視圖大小
        homeViewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)

        // 創建導航控制器
        let navigationController = UINavigationController(rootViewController: homeViewController)
        navigationController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)

        // 載入視圖
        navigationController.loadViewIfNeeded()

        // 執行 snapshot 測試
        assertSnapshot(of: navigationController, as: .image, named: "HomeViewController_WithNavigationBar")
    }

    func testHomeViewControllerScrolledContent() throws {
        // 設定視圖大小
        homeViewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)

        // 載入視圖
        homeViewController.loadViewIfNeeded()

        // 模擬滾動到中間位置
        let scrollView = homeViewController.view.subviews.first { $0 is UIScrollView } as? UIScrollView
        scrollView?.contentOffset = CGPoint(x: 0, y: 200)

        // 執行 snapshot 測試
        assertSnapshot(of: homeViewController, as: .image, named: "HomeViewController_ScrolledContent")
    }

    func testHomeViewControllerOnSpecificDevice() throws {
        // 載入視圖
        homeViewController.loadViewIfNeeded()

        // 使用特定裝置的 snapshot 策略
        assertSnapshot(of: homeViewController, as: .image(on: .iPhoneSe), named: "HomeViewController_iPhoneSE")
        assertSnapshot(of: homeViewController, as: .image(on: .iPhoneX), named: "HomeViewController_iPhoneX")
    }

    func testHomeViewControllerRecursiveDescription() throws {
        // 載入視圖
        homeViewController.loadViewIfNeeded()

        // 測試遞迴描述（視圖層次結構）
        assertSnapshot(of: homeViewController, as: .recursiveDescription, named: "HomeViewController_RecursiveDescription")
    }
}
