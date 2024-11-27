//
//  ViewModel.swift
//  enviro1
//
//  Created by Peter Richardson on 11/25/24.
//

import Foundation
import Observation
import SwiftUI

@Observable class ViewModel {
    var people : [Person]
    var selectedPerson : Person? = nil
    
    init() {
        people  = [
            Person(name: "Chief", age: 20, gender: .other),
            Person(name: "Peter", age: 58, gender: .male),
            Person(name: "Wendy", age: 57, gender: .female)
        ]
    }
}
