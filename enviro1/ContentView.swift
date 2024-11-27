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
        NavigationSplitView {
            List(viewModel.people, id:\.self, selection: $viewModel.selectedPerson) { person in
                Text(person.name)
            }
            
        } detail: {
            if  let person = viewModel.selectedPerson {
                HStack {
                    Image(systemName: person.imageName)
                        .resizable()
                        .foregroundStyle(.tint)
                        .aspectRatio(nil, contentMode: .fit)
                        .frame(width: 75, height: 75)
                    VStack (alignment:.leading) {
                        Text("\(person.name)").font(.largeTitle)
                        Text("\(person.age) \(person.gender)")
                    }
//                    Spacer()
                }
//                Spacer()
                HStack {
                    Button("Transition") {
                        person.transition(to: nil)
                    }
                    Button("Birthday") {
                        person.birthday()
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

#Preview {
    ContentView()
}
