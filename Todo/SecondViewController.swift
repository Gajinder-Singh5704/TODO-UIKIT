//
//  SecondViewController.swift
//  Todo
//
//  Created by Gajinder Singh on 04/04/25.
//

import UIKit

class SecondViewController: UIViewController {

    var task: String? = "TODOOO"
    var desc : String? = "DESCRIPTION"
    
    let taskTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let taskDescription : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        setupLabel()
        setupStackView()
        // Do any additional setup after loading the view.
    }
    
    func setupStackView() {
        view.addSubview(stack)
        
        stack.backgroundColor = .clear
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        stack.addArrangedSubview(taskTitle)
        stack.addArrangedSubview(taskDescription)
        setupLabel()
        setupDescription()
        
    }
    
    func setupDescription() {
//        view.addSubview(taskDescription)
        taskDescription.translatesAutoresizingMaskIntoConstraints = false
        taskDescription.text = desc
        taskDescription.textColor = .black
        taskDescription.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 220/255, alpha: 1)
        NSLayoutConstraint.activate([
            taskDescription.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: 0),
            taskDescription.centerXAnchor.constraint(equalTo: stack.centerXAnchor)
            
        ])
    }
    func setupLabel() {
        taskTitle.text = task ?? ""
        taskTitle.textColor = .black
        taskTitle.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        taskTitle.textAlignment = .center
        taskTitle.backgroundColor = .brown
//        view.addSubview(taskTitle)
        
        NSLayoutConstraint.activate([
            taskTitle.topAnchor.constraint(equalTo: stack.topAnchor, constant: 0),
//            taskTitle.centerXAnchor.constraint(equalTo: stack.centerXAnchor, constant: 0)
        ])
    }
}

#Preview{
    SecondViewController()
}
