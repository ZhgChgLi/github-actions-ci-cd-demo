//
//  SettingsViewControllerTests.swift
//  app-ci-cd-github-actions-demoTests
//
//  Created by harry.li on 2025/6/18.
//

import XCTest
@testable import app_ci_cd_github_actions_demo

final class SettingsViewControllerTests: XCTestCase {
    
    var settingsViewController: SettingsViewController!
    
    override func setUpWithError() throws {
        settingsViewController = SettingsViewController()
        settingsViewController.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        settingsViewController = nil
    }
    
    func testSettingsViewControllerInitialization() throws {
        XCTAssertNotNil(settingsViewController)
        XCTAssertNotNil(settingsViewController.view)
    }
    
    func testSettingsViewControllerTitle() throws {
        XCTAssertEqual(settingsViewController.title, "設定")
    }
    
    func testSettingsViewControllerBackgroundColor() throws {
        XCTAssertEqual(settingsViewController.view.backgroundColor, .systemBackground)
    }
    
    func testTableViewConfiguration() throws {
        let tableView = settingsViewController.view.subviews.first { $0 is UITableView } as? UITableView
        
        XCTAssertNotNil(tableView)
        XCTAssertEqual(tableView?.style, .grouped)
        XCTAssertEqual(tableView?.delegate as? SettingsViewController, settingsViewController)
        XCTAssertEqual(tableView?.dataSource as? SettingsViewController, settingsViewController)
    }
    
    func testTableViewSections() throws {
        let tableView = settingsViewController.view.subviews.first { $0 is UITableView } as? UITableView
        XCTAssertNotNil(tableView)
        
        let numberOfSections = settingsViewController.numberOfSections(in: tableView!)
        XCTAssertEqual(numberOfSections, 4)
    }
    
    func testTableViewRowsInSections() throws {
        let tableView = settingsViewController.view.subviews.first { $0 is UITableView } as? UITableView
        XCTAssertNotNil(tableView)
        
        // 測試每個區段的行數
        XCTAssertEqual(settingsViewController.tableView(tableView!, numberOfRowsInSection: 0), 3) // 帳戶設定區段
        XCTAssertEqual(settingsViewController.tableView(tableView!, numberOfRowsInSection: 1), 3) // 語言區段
        XCTAssertEqual(settingsViewController.tableView(tableView!, numberOfRowsInSection: 2), 3) // 關於區段
        XCTAssertEqual(settingsViewController.tableView(tableView!, numberOfRowsInSection: 3), 1) // 登出區段
    }
    
    func testTableViewCellConfiguration() throws {
        let tableView = settingsViewController.view.subviews.first { $0 is UITableView } as? UITableView
        XCTAssertNotNil(tableView)
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = settingsViewController.tableView(tableView!, cellForRowAt: indexPath)
        
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
        XCTAssertNotNil(cell.textLabel?.text)
    }
    
    func testLogoutCellConfiguration() throws {
        let tableView = settingsViewController.view.subviews.first { $0 is UITableView } as? UITableView
        XCTAssertNotNil(tableView)
        
        let indexPath = IndexPath(row: 0, section: 3) // 登出區段
        let cell = settingsViewController.tableView(tableView!, cellForRowAt: indexPath)
        
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell.accessoryType, .none)
        XCTAssertEqual(cell.textLabel?.textColor, .systemRed)
    }
} 