//
//  ListController.swift
//  Unit.3.Assessment.ToDo
//
//  Created by Jake Gloschat on 2/19/23.
//

import Foundation

class ListController {
    
    // MARK: - Properties
    static let shared = ListController()
    var lists: [List] = []
    
    // MARK: - Initializer
    init() {
        load()
    }
    
    // MARK: - Functions
    func createList(name: String) {
        let list = List(listName: name)
        lists.append(list)
        save()
    }
    
    func deleteList(list: List) {
        guard let index = lists.firstIndex(of: list) else { return }
        lists.remove(at: index)
        save()
    }
    
    // MARK: - Persistence
    private var url: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        else { return nil }
        let url = documentsDirectory.appendingPathComponent("lists.json")
        return url
    }
    
    func save() {
        guard let url = url else { return }
        do {
            let data = try JSONEncoder().encode(lists)
            try data.write(to: url)
        } catch {
            print("Error saving lists", error.localizedDescription)
        }
    }
    
    func load () {
        guard let url = url else { return }
        do {
            let data = try Data(contentsOf: url)
            let lists = try JSONDecoder().decode([List].self, from: data)
            self.lists = lists
        } catch {
            print("Error loading lists", error.localizedDescription)
        }
    }
}
