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
        NetworkManager.shared.fetchData(from: Link.testApi.rawValue) { result in
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

