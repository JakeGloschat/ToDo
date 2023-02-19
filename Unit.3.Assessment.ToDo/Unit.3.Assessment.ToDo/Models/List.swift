//
//  NewToDo.swift
//  Unit.3.Assessment.ToDo
//
//  Created by Jake Gloschat on 2/19/23.
//

import Foundation

class List: Codable {
    let listName: String
    var steps: [Step]
    var isComplete: Bool
    var uuid: UUID
    
    init(listName: String, steps: [Step] = [], isComplete: Bool = false, uuid: UUID = UUID()) {
        self.listName = listName
        self.steps = steps
        self.isComplete = isComplete
        self.uuid = uuid
    }
}

// MARK: - Extensions
extension List: Equatable {
    static func == (lhs: List, rhs: List) -> Bool {
        return rhs.uuid == lhs.uuid
    }
}
