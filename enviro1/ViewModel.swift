//
//  ViewModel.swift
//  enviro1
//
//  Created by Peter Richardson on 11/25/24.
//

import Observation

@Observable class ViewModel {
    var people : [Person]
    
    init() {
        people  = [
            Person(name: "Dude", age: 20, gender: .male),
            Person(name: "Peter", age: 58, gender: .male),
            Person(name: "Wendy", age: 57, gender: .female)
        ]
    }
}
