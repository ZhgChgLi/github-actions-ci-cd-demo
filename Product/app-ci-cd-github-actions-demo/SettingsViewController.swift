//
//  SettingsViewController.swift
//  app-ci-cd-github-actions-demo
//
//  Created by harry.li on 2025/6/18.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private let settingsData = [
        ["帳戶設定", "隱私設定", "通知設定"],
        ["語言", "主題", "字體大小"],
        ["關於", "幫助", "意見回饋"],
        ["登出"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "設定"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingsCell")
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        cell.textLabel?.text = settingsData[indexPath.section][indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        if indexPath.section == settingsData.count - 1 {
            cell.textLabel?.textColor = .systemRed
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let settingName = settingsData[indexPath.section][indexPath.row]
        
        if indexPath.section == settingsData.count - 1 {
            // 登出功能
            showLogoutAlert()
        } else {
            // 其他設定項目
            showSettingDetail(settingName)
        }
    }
    
    private func showLogoutAlert() {
        let alert = UIAlertController(title: "登出", message: "確定要登出嗎？", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "取消", style: .cancel))
        alert.addAction(UIAlertAction(title: "登出", style: .destructive) { _ in
            // 假登出功能
            print("使用者已登出")
        })
        present(alert, animated: true)
    }
    
    private func showSettingDetail(_ settingName: String) {
        let alert = UIAlertController(title: settingName, message: "此功能正在開發中", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "確定", style: .default))
        present(alert, animated: true)
    }
} 