//
//  ContentView.swift
//  enviro1
//
//  Created by Peter Richardson on 11/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        switch viewModel.state {
        case .notLoaded:
            Color.clear.onAppear { viewModel.load() }
        case .loaded:
            NavigationSplitView {
                List(viewModel.people, id:\.self, selection: $viewModel.selectedPerson) { person in
                    Text(person.name)
                }
                
            } detail: {
                if  let person = viewModel.selectedPerson {
                    VStack {
                        ZStack {
                            Circle()
                                .foregroundColor(viewModel.colorForGender(person.gender))
                                .padding()
                            VStack {
                                Image(systemName: viewModel.imageForGender(person.gender))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:75, height: 75)
                                Text("\(person.name)").font(.largeTitle)
                                Text("\(person.age) \(person.gender)")
                            }
                            .padding()
                        }
                        HStack {
                            Button("Transition") {
                                person.transition(to: nil)
                            }
                            Button("Birthday") {
                                person.birthday()
                            }
                        }
                    }.padding()
                }
                else {
                    Text("Select a person")
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
