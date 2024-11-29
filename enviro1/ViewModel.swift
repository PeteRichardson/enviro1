//
//  ViewModel.swift
//  enviro1
//
//  Created by Peter Richardson on 11/25/24.
//

import Foundation
import Observation
import SwiftUI
import AudioToolbox

private let somePeople  = [
    Person(name: "Pat", age: 20, gender: .other),
    Person(name: "Nicholas", age: 58, gender: .male),
    Person(name: "Cleopatra", age: 57, gender: .female)
]



@Observable class ViewModel {
    enum State {
        case notLoaded
        case loaded
    }
    
    var state: State = .notLoaded
    var people : [Person] = []
    var selectedPerson : Person? = nil
    
    func load() {
        do {
            let fileURL = URL(fileURLWithPath: "/Users/pete/Downloads/people.json")
            let jsonData = try Data(contentsOf: fileURL)
            self.people = try JSONDecoder().decode([Person].self, from: jsonData)
        } catch {
            print("\(error) ")
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_UserPreferredAlert))
            self.people = somePeople
        }
        self.state = .loaded
    }
    
    func imageForGender(_ gender: Person.Gender) -> String {
        switch gender {
        case .male: return "figure.stand"
        case .female: return "figure.stand.dress"
        case .other: return "figure.wave"
        }
    }

    func colorForGender(_ gender: Person.Gender) -> Color {
        switch gender {
        case .male: return Color.Palette.ChinaRose
        case .female: return Color.Palette.ShamrockGreen
        case .other: return Color.Palette.RazzleDazzleRose
        }
    }
}
