//
//  ContentView.swift
//  enviro1
//
//  Created by Peter Richardson on 11/25/24.
//

import SwiftUI

struct PrettyButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(5)
            .foregroundColor(Color.Palette.Aureolin)
            .background(Color.Palette.SpaceCadet)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .border(Color.Palette.Aureolin, width: 2)
            .clipShape(RoundedRectangle(cornerRadius: 4.0))
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    
    
}

struct ContentView: View {
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        switch viewModel.state {
        case .notLoaded:
            Color.clear.onAppear { viewModel.load() }
        case .loaded:
            NavigationSplitView {
                List(viewModel.people, id:\.self, selection: $viewModel.selectedPerson) { person in
                    Text(person.name).bold()
                }
                .background(Color.Palette.EnglishViolet)
                .foregroundColor(.Palette.Mindaro)
                
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
                            .foregroundColor(.Palette.Mindaro)
                            .padding()
                        }
                        HStack {
                            Button("Transition") {
                                person.transition(to: nil)
                            }
                            .buttonStyle(PrettyButton())

                            Button("Birthday") {
                                person.birthday()
                            }
                            .buttonStyle(PrettyButton())
                        }
                    }.padding()
                }
                else {
                    Text("Select a person")
                }
            }.background(Color.Palette.SpaceCadet)
        }
    }
}

#Preview {
    ContentView()
}
