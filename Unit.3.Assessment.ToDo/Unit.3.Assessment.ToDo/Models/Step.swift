//
//  Step.swift
//  Unit.3.Assessment.ToDo
//
//  Created by Jake Gloschat on 2/19/23.
//

import Foundation

class Step: Codable {
    var stepName: String
    var isComplete: Bool
    let uuid: UUID
    
    init(step: String, isComplete: Bool = false, uuid: UUID = UUID()) {
        self.stepName = step
        self.isComplete = isComplete
        self.uuid = uuid
    }
}

// MARK: - Extensions

extension Step: Equatable {
    static func == (lhs: Step, rhs: Step) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
