//
//  ActivityIndicatorView.swift
//  Avito Trainee
//
//  Created by packovv on 24.10.2022.
//

import UIKit

final class ActivityIndicatorView: UIActivityIndicatorView {
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        return activityIndicator
    }()
    
    func startActivityIndicator(_ view: UIView) {
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        view.isUserInteractionEnabled = false
    }
    
    func stopActivityIndicator(_ view: UIView) {
        activityIndicator.stopAnimating()
        view.isUserInteractionEnabled = true
    }
}
