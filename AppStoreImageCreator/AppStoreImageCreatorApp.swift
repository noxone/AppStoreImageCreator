//
//  AppStoreImageCreatorApp.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 30.03.24.
//

import SwiftUI

@main
struct AppStoreImageCreatorApp: App {
    let model = ApplicationModel()
    
    var body: some Scene {
        WindowGroup {
            // ContentView()
            TestView()
                .environmentObject(model)
        }
    }
}
