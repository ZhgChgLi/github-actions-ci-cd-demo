//
//  HomeViewControllerTests.swift
//  app-ci-cd-github-actions-demoTests
//
//  Created by harry.li on 2025/6/18.
//

import XCTest
@testable import app_ci_cd_github_actions_demo

final class HomeViewControllerTests: XCTestCase {
    
    var homeViewController: HomeViewController!
    
    override func setUpWithError() throws {
        homeViewController = HomeViewController()
        homeViewController.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        homeViewController = nil
    }
    
    func testHomeViewControllerInitialization() throws {
        XCTAssertNotNil(homeViewController)
        XCTAssertNotNil(homeViewController.view)
    }
    
    func testHomeViewControllerTitle() throws {
        XCTAssertEqual(homeViewController.title, "首頁")
    }
    
    func testHomeViewControllerBackgroundColor() throws {
        XCTAssertEqual(homeViewController.view.backgroundColor, .systemBackground)
    }
    
    func testScrollViewConfiguration() throws {
        let scrollView = homeViewController.view.subviews.first { $0 is UIScrollView } as? UIScrollView
        
        XCTAssertNotNil(scrollView)
        XCTAssertFalse(scrollView!.showsVerticalScrollIndicator)
    }
    
    func testContentViewConfiguration() throws {
        let scrollView = homeViewController.view.subviews.first { $0 is UIScrollView } as? UIScrollView
        XCTAssertNotNil(scrollView)
        
        let contentView = scrollView!.subviews.first
        XCTAssertNotNil(contentView)
        XCTAssertEqual(contentView?.backgroundColor, .clear)
    }
    
    func testWelcomeLabelConfiguration() throws {
        let scrollView = homeViewController.view.subviews.first { $0 is UIScrollView } as? UIScrollView
        XCTAssertNotNil(scrollView)
        
        let contentView = scrollView!.subviews.first
        XCTAssertNotNil(contentView)
        
        let welcomeLabel = contentView!.subviews.first { $0 is UILabel } as? UILabel
        XCTAssertNotNil(welcomeLabel)
        XCTAssertEqual(welcomeLabel?.font, UIFont.boldSystemFont(ofSize: 28))
        XCTAssertEqual(welcomeLabel?.textAlignment, .left)
        XCTAssertEqual(welcomeLabel?.numberOfLines, 0)
    }
    
    func testStatsStackViewConfiguration() throws {
        let scrollView = homeViewController.view.subviews.first { $0 is UIScrollView } as? UIScrollView
        XCTAssertNotNil(scrollView)
        
        let contentView = scrollView!.subviews.first
        XCTAssertNotNil(contentView)
        
        let statsStackView = contentView!.subviews.first { $0 is UIStackView } as? UIStackView
        XCTAssertNotNil(statsStackView)
        XCTAssertEqual(statsStackView?.axis, .horizontal)
        XCTAssertEqual(statsStackView?.distribution, .fillEqually)
        XCTAssertEqual(statsStackView?.spacing, 16)
    }
    
    func testRecentActivityLabelConfiguration() throws {
        let scrollView = homeViewController.view.subviews.first { $0 is UIScrollView } as? UIScrollView
        XCTAssertNotNil(scrollView)
        
        let contentView = scrollView!.subviews.first
        XCTAssertNotNil(contentView)
        
        let labels = contentView!.subviews.compactMap { $0 as? UILabel }
        let recentActivityLabel = labels.first { $0.text == "最近活動" }
        
        XCTAssertNotNil(recentActivityLabel)
        XCTAssertEqual(recentActivityLabel?.font, UIFont.boldSystemFont(ofSize: 20))
    }
    
    func testActivityTableViewConfiguration() throws {
        let scrollView = homeViewController.view.subviews.first { $0 is UIScrollView } as? UIScrollView
        XCTAssertNotNil(scrollView)
        
        let contentView = scrollView!.subviews.first
        XCTAssertNotNil(contentView)
        
        let activityTableView = contentView!.subviews.first { $0 is UITableView } as? UITableView
        XCTAssertNotNil(activityTableView)
        XCTAssertEqual(activityTableView?.delegate as? HomeViewController, homeViewController)
        XCTAssertEqual(activityTableView?.dataSource as? HomeViewController, homeViewController)
        XCTAssertFalse(activityTableView!.isScrollEnabled)
        XCTAssertEqual(activityTableView?.backgroundColor, .clear)
    }
    
    func testActivityTableViewRows() throws {
        let scrollView = homeViewController.view.subviews.first { $0 is UIScrollView } as? UIScrollView
        XCTAssertNotNil(scrollView)
        
        let contentView = scrollView!.subviews.first
        XCTAssertNotNil(contentView)
        
        let activityTableView = contentView!.subviews.first { $0 is UITableView } as? UITableView
        XCTAssertNotNil(activityTableView)
        
        let numberOfRows = homeViewController.tableView(activityTableView!, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 4) // 4 個活動項目
    }
    
    func testActivityTableViewCellConfiguration() throws {
        let scrollView = homeViewController.view.subviews.first { $0 is UIScrollView } as? UIScrollView
        XCTAssertNotNil(scrollView)
        
        let contentView = scrollView!.subviews.first
        XCTAssertNotNil(contentView)
        
        let activityTableView = contentView!.subviews.first { $0 is UITableView } as? UITableView
        XCTAssertNotNil(activityTableView)
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = homeViewController.tableView(activityTableView!, cellForRowAt: indexPath)
        
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
        XCTAssertNotNil(cell.textLabel?.text)
    }
} 
