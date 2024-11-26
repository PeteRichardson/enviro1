//
//  enviro1App.swift
//  enviro1
//
//  Created by Peter Richardson on 11/25/24.
//

import SwiftUI



@main
struct enviro1App: App {
    @State var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
