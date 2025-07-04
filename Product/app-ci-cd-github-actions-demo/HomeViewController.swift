//
//  HomeViewController.swift
//  app-ci-cd-github-actions-demo
//
//  Created by harry.li on 2025/6/18.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let welcomeLabel = UILabel()
    private let statsStackView = UIStackView()
    private let recentActivityLabel = UILabel()
    private let activityTableView = UITableView()
    
    private let recentActivities = [
        "完成任務 A",
        "更新個人資料",
        "加入新專案",
        "收到新訊息"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        loadData()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "首頁"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 設定導航列按鈕
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonTapped)
        )
        
        // ScrollView
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        
        // Content View
        contentView.backgroundColor = .clear
        scrollView.addSubview(contentView)
        
        // Welcome Label
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 28)
        welcomeLabel.textAlignment = .left
        welcomeLabel.numberOfLines = 0
        contentView.addSubview(welcomeLabel)
        
        // Stats Stack View
        statsStackView.axis = .horizontal
        statsStackView.distribution = .fillEqually
        statsStackView.spacing = 16
        contentView.addSubview(statsStackView)
        
        // 創建統計卡片
        createStatCard(title: "任務", value: "12", color: .systemBlue)
        createStatCard(title: "完成", value: "8", color: .systemGreen)
        createStatCard(title: "進行中", value: "4", color: .systemOrange)
        
        // Recent Activity Label
        recentActivityLabel.font = UIFont.boldSystemFont(ofSize: 20)
        recentActivityLabel.text = "最近活動"
        contentView.addSubview(recentActivityLabel)
        
        // Activity Table View
        activityTableView.delegate = self
        activityTableView.dataSource = self
        activityTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ActivityCell")
        activityTableView.isScrollEnabled = false
        activityTableView.backgroundColor = .clear
        contentView.addSubview(activityTableView)
    }
    
    private func createStatCard(title: String, value: String, color: UIColor) {
        let cardView = UIView()
        cardView.backgroundColor = color.withAlphaComponent(0.1)
        cardView.layer.cornerRadius = 12
        cardView.layer.borderWidth = 1
        cardView.layer.borderColor = color.withAlphaComponent(0.3).cgColor
        
        let valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.font = UIFont.boldSystemFont(ofSize: 24)
        valueLabel.textColor = color
        valueLabel.textAlignment = .center
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = .systemGray
        titleLabel.textAlignment = .center
        
        cardView.addSubview(valueLabel)
        cardView.addSubview(titleLabel)
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            valueLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 4),
            titleLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16)
        ])
        
        statsStackView.addArrangedSubview(cardView)
    }
    
    private func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        statsStackView.translatesAutoresizingMaskIntoConstraints = false
        recentActivityLabel.translatesAutoresizingMaskIntoConstraints = false
        activityTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            welcomeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            statsStackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 30),
            statsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            statsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            statsStackView.heightAnchor.constraint(equalToConstant: 100),
            
            recentActivityLabel.topAnchor.constraint(equalTo: statsStackView.bottomAnchor, constant: 30),
            recentActivityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            recentActivityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            activityTableView.topAnchor.constraint(equalTo: recentActivityLabel.bottomAnchor, constant: 16),
            activityTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            activityTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            activityTableView.heightAnchor.constraint(equalToConstant: CGFloat(recentActivities.count * 44)),
            activityTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    private func loadData() {
        welcomeLabel.text = "歡迎回來，張小明！\n今天是美好的一天"
    }
    
    @objc private func addButtonTapped() {
        let alert = UIAlertController(title: "新增", message: "新增功能即將推出", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "確定", style: .default))
        present(alert, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentActivities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath)
        cell.textLabel?.text = recentActivities[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let activity = recentActivities[indexPath.row]
        
        let alert = UIAlertController(title: "活動詳情", message: activity, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "確定", style: .default))
        present(alert, animated: true)
    }
} 