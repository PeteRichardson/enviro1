//
//  Person.swift
//  enviro1
//
//  Created by Peter Richardson on 11/25/24.
//

import Foundation
import Observation

@Observable class Person : Identifiable, Hashable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    enum Gender: String, CaseIterable, Hashable {
        case male, female, other
    }
    
    var id: UUID = UUID()
    var name: String = ""
    var age: Int = 0
    var gender: Gender = .female
    
    init (name: String, age: Int, gender: Gender) {
        self.name = name
        self.age = age
        self.gender = gender
    }
    
    func birthday() {
        self.age += 1
    }
    
    func transition(to newGender: Gender?) {
        self.gender = newGender ?? Gender.allCases.randomElement()!
    }
}
