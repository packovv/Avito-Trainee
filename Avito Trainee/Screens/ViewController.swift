//
//  ViewController.swift
//  Avito Trainee
//
//  Created by packovv on 18.10.2022.
//

import UIKit

class ViewController: UITableViewController {

    private var welcomeForView: Welcome?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseId)
        self.tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.reuseId)
        navigationItem.title = "Company"
        fetchData(with: Link.json.rawValue)
    }
    
    private func fetchData(with url: String) {
        NetworkManager.shared.fetchData(from: url) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let welcome):
                    self.welcomeForView = welcome
                    print("Success")
                    print(welcome)
                case .failure(let error):
                    print(error)
                }
                self.tableView.reloadData()
            }
        }
    }


}

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
            
            let currentEmployee = welcomeForView?.company.employees[indexPath.row - 1]
            commonCell.employee = currentEmployee
            
            return commonCell
            
        } else {
            
            let titleCell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.reuseId, for: indexPath)

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

