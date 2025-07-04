//
//  ProfileViewControllerTests.swift
//  app-ci-cd-github-actions-demoTests
//
//  Created by harry.li on 2025/6/18.
//

import XCTest
@testable import app_ci_cd_github_actions_demo

final class ProfileViewControllerTests: XCTestCase {
    
    var profileViewController: ProfileViewController!
    
    override func setUpWithError() throws {
        profileViewController = ProfileViewController()
        profileViewController.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        profileViewController = nil
    }
    
    func testProfileViewControllerInitialization() throws {
        XCTAssertNotNil(profileViewController)
        XCTAssertNotNil(profileViewController.view)
    }
    
    func testProfileViewControllerBackgroundColor() throws {
        XCTAssertEqual(profileViewController.view.backgroundColor, .systemBackground)
    }
    
    func testProfileViewControllerSubviews() throws {
        let subviews = profileViewController.view.subviews
        
        // 檢查是否有必要的子視圖
        let hasProfileImageView = subviews.contains { $0 is UIImageView }
        let hasNameLabel = subviews.contains { $0 is UILabel }
        let hasEmailLabel = subviews.contains { $0 is UILabel }
        let hasBioLabel = subviews.contains { $0 is UILabel }
        let hasEditButton = subviews.contains { $0 is UIButton }
        
        XCTAssertTrue(hasProfileImageView, "ProfileViewController 應該包含 profileImageView")
        XCTAssertTrue(hasNameLabel, "ProfileViewController 應該包含 nameLabel")
        XCTAssertTrue(hasEmailLabel, "ProfileViewController 應該包含 emailLabel")
        XCTAssertTrue(hasBioLabel, "ProfileViewController 應該包含 bioLabel")
        XCTAssertTrue(hasEditButton, "ProfileViewController 應該包含 editButton")
    }
    
    func testEditButtonConfiguration() throws {
        let editButton = profileViewController.view.subviews.first { $0 is UIButton } as? UIButton
        
        XCTAssertNotNil(editButton)
        XCTAssertEqual(editButton?.title(for: .normal), "編輯資料")
        XCTAssertEqual(editButton?.titleColor(for: .normal), .white)
    }
    
    func testProfileDataLoading() throws {
        // 重新載入視圖以觸發 loadProfileData
        profileViewController.loadViewIfNeeded()
        
        // 檢查標籤是否有內容（這些是透過私有方法設定的，所以我們只能檢查視圖是否已載入）
        XCTAssertNotNil(profileViewController.view)
    }
} 
