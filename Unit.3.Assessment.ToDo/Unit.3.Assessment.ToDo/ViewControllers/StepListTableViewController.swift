//
//  StepListTableViewController.swift
//  Unit.3.Assessment.ToDo
//
//  Created by Jake Gloschat on 2/19/23.
//

import UIKit

class StepListTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var toDoNameTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions
    @IBAction func addButtonWasTapped(_ sender: Any) {
        guard let name = toDoNameTextField.text, !name.isEmpty else { return }
        StepController.createStep(list: <#T##List#>, stepName: <#T##String#>)
        
    }
    
    
    // MARK: - Properties
    var list: List?
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list?.steps.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "stepCell", for: indexPath) as? StepListTableViewCell,
              let list = list?.steps[indexPath.row] else { return UITableViewCell() }
       
        cell.updateViews(step: list)
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
}

// MARK: - Extensions
extension StepListTableViewController: StepListTableViewCellDelegate {
    func isCompleteButtonWasTapped(_ cell: StepListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell),
        let step = list?.steps[indexPath.row] else { return }
        StepController.toggleIsComplete(step: step)
        cell.updateViews(step: step)
        
    }
}
