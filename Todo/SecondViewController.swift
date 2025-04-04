//
//  SecondViewController.swift
//  Todo
//
//  Created by Gajinder Singh on 04/04/25.
//

import UIKit

class SecondViewController: UIViewController {

    var task: String? = "TODOOO"
    
    let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLabel()
        // Do any additional setup after loading the view.
    }
    
    func setupLabel() {
        label.text = task ?? ""
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 26)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
}

#Preview{
    SecondViewController()
}
