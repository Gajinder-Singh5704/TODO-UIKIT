//
//  ViewController.swift
//  Todo
//
//  Created by Gajinder Singh on 03/04/25.
//

import UIKit

class ViewController: UIViewController {

    var names = [
        "DO GYM",
        "DO TABLE VIEW",
        "NAVIGATION",
        "PHPICKER",
        "JIRA"
    ]
    
    private let heading : UILabel = {
        let label = UILabel()
        label.text = "TODOS"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tableView : UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 50
        stack.backgroundColor = .blue
        stack.layer.cornerRadius = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let addButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("Add Task", for: .normal)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
          
        setupLabel()
        setupTableView()
        setupAddButton()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        tableView.delegate = self
        tableView.dataSource = self
        
        }

    func setupLabel(){
        view.addSubview(heading)
        
        NSLayoutConstraint.activate([
            heading.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            heading.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
        ])
    }
    
    func setupAddButton() {
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant : 20),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            addButton.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        addButton.addTarget(self, action: #selector(showInputAlert), for: .touchUpInside)
    }
    
    @objc func showInputAlert() {
        let alert = UIAlertController(title: "Enter Task", message: "Enter the task todo", preferredStyle: .alert)

        alert.addTextField { textField in
            textField.placeholder = "ADD TASK"
        }
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { _ in
            if let todo = alert.textFields?.first?.text {
                
                let indexPath = IndexPath(row: self.names.count , section: 0)
                self.names.append(todo)
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: [indexPath], with: .left)
                self.tableView.endUpdates()
                print("Entered Name: \(todo)")
                print(self.names)
            }
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        alert.addAction(submitAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }

}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("Removing: \(names[indexPath.row])")
            
            guard names.indices.contains(indexPath.row) else { return }
            
            names.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .right)
            tableView.endUpdates()
        }

}

extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
}

#Preview{
    ViewController()
}
