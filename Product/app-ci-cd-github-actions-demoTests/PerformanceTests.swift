//
//  PerformanceTests.swift
//  app-ci-cd-github-actions-demoTests
//
//  Created by harry.li on 2025/6/18.
//

import XCTest
@testable import app_ci_cd_github_actions_demo

final class PerformanceTests: XCTestCase {
    
    func testViewControllerInitializationPerformance() throws {
        measure {
            for _ in 0..<100 {
                let homeVC = HomeViewController()
                homeVC.loadViewIfNeeded()
            }
        }
    }
    
    func testProfileViewControllerSetupPerformance() throws {
        measure {
            for _ in 0..<50 {
                let profileVC = ProfileViewController()
                profileVC.loadViewIfNeeded()
                
                // 模擬一些 UI 操作
                let button = profileVC.view.subviews.first { $0 is UIButton } as? UIButton
                button?.sendActions(for: .touchUpInside)
            }
        }
    }
    
    func testSettingsViewControllerTableViewPerformance() throws {
        let settingsVC = SettingsViewController()
        settingsVC.loadViewIfNeeded()
        
        let tableView = settingsVC.view.subviews.first { $0 is UITableView } as? UITableView
        XCTAssertNotNil(tableView)
        
        measure {
            for _ in 0..<100 {
                // 測試表格視圖的效能
                let numberOfSections = settingsVC.numberOfSections(in: tableView!)
                for section in 0..<numberOfSections {
                    let numberOfRows = settingsVC.tableView(tableView!, numberOfRowsInSection: section)
                    for row in 0..<numberOfRows {
                        let indexPath = IndexPath(row: row, section: section)
                        _ = settingsVC.tableView(tableView!, cellForRowAt: indexPath)
                    }
                }
            }
        }
    }
    
    func testHomeViewControllerScrollViewPerformance() throws {
        let homeVC = HomeViewController()
        homeVC.loadViewIfNeeded()
        
        let scrollView = homeVC.view.subviews.first { $0 is UIScrollView } as? UIScrollView
        XCTAssertNotNil(scrollView)
        
        measure {
            for _ in 0..<1000 {
                // 模擬滾動操作
                scrollView?.contentOffset = CGPoint(x: 0, y: CGFloat.random(in: 0...500))
            }
        }
    }
    
    func testViewControllerMemoryUsagePerformance() throws {
        measure {
            var viewControllers: [UIViewController] = []
            
            for _ in 0..<100 {
                let homeVC = HomeViewController()
                let profileVC = ProfileViewController()
                let settingsVC = SettingsViewController()
                
                homeVC.loadViewIfNeeded()
                profileVC.loadViewIfNeeded()
                settingsVC.loadViewIfNeeded()
                
                viewControllers.append(contentsOf: [homeVC, profileVC, settingsVC])
            }
            
            // 清空陣列以釋放記憶體
            viewControllers.removeAll()
        }
    }
    
    func testTableViewScrollingPerformance() throws {
        let settingsVC = SettingsViewController()
        settingsVC.loadViewIfNeeded()
        
        let tableView = settingsVC.view.subviews.first { $0 is UITableView } as? UITableView
        XCTAssertNotNil(tableView)
        
        measure {
            for _ in 0..<100 {
                // 模擬表格視圖滾動
                let randomSection = Int.random(in: 0..<settingsVC.numberOfSections(in: tableView!))
                let randomRow = Int.random(in: 0..<settingsVC.tableView(tableView!, numberOfRowsInSection: randomSection))
                let indexPath = IndexPath(row: randomRow, section: randomSection)
                
                // 模擬選擇行
                settingsVC.tableView(tableView!, didSelectRowAt: indexPath)
            }
        }
    }
    
    func testViewControllerConstraintLayoutPerformance() throws {
        measure {
            for _ in 0..<50 {
                let homeVC = HomeViewController()
                homeVC.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
                homeVC.loadViewIfNeeded()
                
                // 觸發佈局更新
                homeVC.view.setNeedsLayout()
                homeVC.view.layoutIfNeeded()
            }
        }
    }
} 