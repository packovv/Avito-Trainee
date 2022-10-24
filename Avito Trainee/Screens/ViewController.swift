//
//  ViewController.swift
//  Avito Trainee
//
//  Created by packovv on 18.10.2022.
//

import UIKit

class ViewController: UIViewController {

    private var welcomeForView: Welcome?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchData(from: Link.json.rawValue) { result in
            switch result {
            case .success(let welcome):
                self.welcomeForView = welcome
                print("Success")
                print(welcome)
            case .failure(let error):
                print(error)
            }
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        
        return cell
    }
    
    
}

