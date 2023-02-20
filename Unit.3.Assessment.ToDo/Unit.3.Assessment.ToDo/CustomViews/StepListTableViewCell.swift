//
//  StepListTableViewCell.swift
//  Unit.3.Assessment.ToDo
//
//  Created by Jake Gloschat on 2/19/23.
//

import UIKit

protocol StepListTableViewCellDelegate: AnyObject {
    func isCompleteButtonWasTapped(_ cell: StepListTableViewCell)
}

class StepListTableViewCell: UITableViewCell {

// MARK: - Outlets
    @IBOutlet weak var stepNameLabel: UILabel!
    @IBOutlet weak var isCompleteButton: UIButton!
    
    // MARK: - Properties
    weak var delegate: StepListTableViewCellDelegate?
    
    // MARK: - Functions
    func updateViews(step: Step) {
        stepNameLabel.text = step.stepName
        
        let imageName = step.isComplete ? "checkmark.seal.fill" : "checkmark.seal"
        isCompleteButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    // MARK: - Actions
    @IBAction func isCompleteButtonTapped(_ sender: Any) {
        delegate?.isCompleteButtonWasTapped(self)
    }
}
