//
//  Person.swift
//  enviro1
//
//  Created by Peter Richardson on 11/25/24.
//

import Foundation
import Observation

@Observable final class Person : Identifiable, Hashable, Decodable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    enum Gender: String, CaseIterable, Hashable, Decodable {
        case male, female, other
    }
    
    var id: String { name }
    var name: String = ""
    var age: Int = 0
    var gender: Gender = .female
    
    init (name: String, age: Int, gender: Gender) {
        self.name = name
        self.age = age
        self.gender = gender
    }
    
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decode(String.self, forKey: .name)
            age = try container.decode(Int.self, forKey: .age)
            gender = try container.decode(Gender.self, forKey: .gender)
        } catch {
            print("\(error)")
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case name, age, gender
    }
    
    func birthday() {
        self.age += 1
    }
    
    func transition(to newGender: Gender?) {
        if let nextGender = newGender {
            self.gender = nextGender
        } else {  // no newGender specified, so pick one
                  // but make sure it's different than the current one
            var nextGender: Gender
            repeat {
                nextGender = Gender.allCases.randomElement()!
            } while nextGender == self.gender
            self.gender = nextGender
        }
    }
}
