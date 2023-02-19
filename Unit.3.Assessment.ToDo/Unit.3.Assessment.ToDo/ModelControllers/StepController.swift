//
//  StepController.swift
//  Unit.3.Assessment.ToDo
//
//  Created by Jake Gloschat on 2/19/23.
//

import Foundation

class StepController {
    
    
    // MARK: - Functions
    static func createStep(list: List, stepName: String) {
        let step = Step(step: stepName)
        list.steps.append(step)
        ListController.shared.save()
    }
    
    static func updateStep(step: Step, stepName: String) {
        step.stepName = stepName
        ListController.shared.save()
    }
    
    static func deleteStep(step: Step, in list: List) {
        guard let index = list.steps.firstIndex(of: step) else { return }
        list.steps.remove(at: index)
        ListController.shared.save()
    }
    
    func toggleIsComplete(list: List) {
        list.isComplete.toggle()
        ListController.shared.save()
    }
}
