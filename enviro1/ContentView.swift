//
//  ContentView.swift
//  enviro1
//
//  Created by Peter Richardson on 11/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(ViewModel.self) var viewModel
    @State private var selectedPerson : Person? = nil

    
    var body: some View {
        NavigationSplitView {
            List(viewModel.people, id:\.self, selection: $selectedPerson) { person in
                Text(person.name)
            }
            
        } detail: {
            if  let selectedPerson {
                VStack {
                    Image(systemName: "person.crop.circle")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("\(selectedPerson.name) is [\(selectedPerson.age) \(selectedPerson.gender)]")
                    
                }
                HStack {
                    Button("Transition") {
                        selectedPerson.transition(to: nil)
                    }
                    Button("Birthday") {
                        selectedPerson.birthday()
                    }
                }
                .padding()
            }
            else {
                Text("Select a person")
            }
        }
        
    }
}

//#Preview {
//    ContentView()
//}
