//
//  ViewController.swift
//  Avito Trainee
//
//  Created by packovv on 18.10.2022.
//

import UIKit

class ViewController: UITableViewController {

    private let activityIndicator = ActivityIndicatorView()
    
    private var welcomeForView: Welcome?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData(with: Link.json.rawValue)
//        welcomeForView?.company.employees.sort()
    }
    
    private func setupUI() {
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseId)
        self.tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.reuseId)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "Company"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(
            displayP3Red: 111/255,
            green: 101/255,
            blue: 192/255,
            alpha: 194/255
        )
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .search,
            target: self,
            action: #selector(sendRequest)
        )
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func fetchData(with url: String) {
        activityIndicator.startActivityIndicator(tableView)
        NetworkManager.shared.fetchData(from: url) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let welcome):
                    self.welcomeForView = welcome
                    self.welcomeForView?.company.employees.sort(by: <)
                    print("Success")
                    print(welcome)
                case .failure(let error):
                    print(error)
                    self.showAlert(message: error)
                }
                self.tableView.reloadData()
                self.activityIndicator.stopActivityIndicator(self.tableView)
            }
        }
    }
    
    @objc private func sendRequest() {
        fetchData(with: Link.json.rawValue)
    }
    
    
}

// UITableView
extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let number = welcomeForView?.company.employees.count {
            return number + 1
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row != 0 {
            
            let commonCell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseId, for: indexPath) as! TableViewCell
            commonCell.selectionStyle = .none
            
            let currentEmployee = welcomeForView?.company.employees[indexPath.row - 1]
            commonCell.employee = currentEmployee
            
            return commonCell
            
        } else {
            
            let titleCell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.reuseId, for: indexPath)
            titleCell.selectionStyle = .none

            var content = titleCell.defaultContentConfiguration()
            content.text = welcomeForView?.company.name
            titleCell.contentConfiguration = content

            return titleCell
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// UIAlertController
extension ViewController {
    private func showAlert(message: NetworkError) {
        let alert = UIAlertController.createAlertController(withMessage: message.localizedDescription)
        alert.action()
        present(alert, animated: true)
    }
}

