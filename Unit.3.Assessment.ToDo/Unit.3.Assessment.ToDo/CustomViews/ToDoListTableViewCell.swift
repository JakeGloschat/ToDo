//
//  ToDoListTableViewCell.swift
//  Unit.3.Assessment.ToDo
//
//  Created by Jake Gloschat on 2/19/23.
//

import UIKit

protocol ToDoListTableViewCellDelegate: AnyObject {
    func isCompleteButtonWasTapped(_ cell: ToDoListTableViewCell)
}

class ToDoListTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var toDoNameLabel: UILabel!
    @IBOutlet weak var listCountLabel: UILabel!
  
    // MARK: - Properties
    weak var delegate: ToDoListTableViewCellDelegate?
    var list: List? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Functions
    func updateViews() {
        guard let list = list else { return }
        toDoNameLabel.text = list.listName
        listCountLabel.text = String(list.steps.count)
        
        let image = list.isComplete ? "checkmark.seal.fill" : "checkmark.seal"
        isCompleteButton.setImage(UIImage(systemName: image), for: .normal)
        
    }
                                  
    // MARK: - Actions
    @IBAction func isCompleteButtonTapped(_ sender: Any) {
        delegate?.isCompleteButtonWasTapped(self)
    }
}
