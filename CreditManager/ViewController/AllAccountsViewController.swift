//
//  AllAccountsViewController.swift
//  CreditManager
//
//  Created by Patel, Anudeep on 31/10/20.
//

import UIKit

class AllAccountsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    var userAccounts: [User] = []
    
    override func viewDidLoad() {   
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "All Accounts"
        print("Test 123")
        userAccounts = fetchData()
        configureTableView()
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "accuntscell")
        tableView.pin(to: view)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userAccounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accuntscell", for: indexPath) as! UserTableViewCell
        let user = userAccounts[indexPath.row]
        cell.set(user: user)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteUser = deleteUserDataAction(at : indexPath)
        return UISwipeActionsConfiguration(actions: [deleteUser])
    }
    
    func deleteUserDataAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "Delete") { (action, view, completion) in
            self.userAccounts.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.image = UIImage(systemName: "trash")
        action.backgroundColor = .red
        return action
    }
}
