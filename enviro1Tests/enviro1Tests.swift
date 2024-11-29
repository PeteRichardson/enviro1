//
//  enviro1Tests.swift
//  enviro1Tests
//
//  Created by Peter Richardson on 11/29/24.
//

import Testing
@testable import enviro1

struct enviro1Tests {
    private let somePeople  = [
        Person(name: "Pat", age: 20, gender: .other),
        Person(name: "Nicholas", age: 58, gender: .male),
        Person(name: "Cleopatra", age: 57, gender: .female)
    ]

    @Test func TransitionToRandomDifferentGender() async throws {
        let person: Person = somePeople[0]  // Pat
        #expect(person.gender == .other)
        person.transition(to: nil)
        #expect(person.gender != .other)
    }
    
    @Test func TransitionToSpecificGender() async throws {
        let person: Person = somePeople[0]  // Pat
        #expect(person.gender == .other)
        person.transition(to: .female)
        #expect(person.gender == .female)
    }

}
