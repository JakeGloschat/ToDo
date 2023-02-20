//
//  ListTableViewController.swift
//  Unit.3.Assessment.ToDo
//
//  Created by Jake Gloschat on 2/19/23.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var toDoTextField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions
    @IBAction func createButtonTapped(_ sender: Any) {
        guard let name = toDoTextField.text, !name.isEmpty else { return }
        ListController.shared.createList(name: name)
       updateUI()
    }
    
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListController.shared.lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as? ToDoListTableViewCell else { return UITableViewCell() }
        
        let list = ListController.shared.lists[indexPath.row]
        cell.list = list
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let list = ListController.shared.lists[indexPath.row]
            ListController.shared.deleteList(list: list)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Helper
   func updateUI() {
       self.tableView.reloadData()
    }
     // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard segue.identifier == "toStepList",
              let destinationVC = segue.destination as? StepListTableViewController,
              let indexPath = tableView.indexPathForSelectedRow else { return }
         let list = ListController.shared.lists[indexPath.row]
         destinationVC.list = list
     }
}

// MARK: - Extensions
extension ToDoListTableViewController: ToDoListTableViewCellDelegate {
    func isCompleteButtonWasTapped(_ cell: ToDoListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let list = ListController.shared.lists[indexPath.row]
        ListController.shared.toggleIsComplete(list: list)
        cell.list = list
    }
}
