//
//  ProjectModel.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 30.03.24.
//

import Foundation

class ProjectModel : ObservableObject {
    @Published var createOn: Date = Date.now
    @Published var lastChanged: Date = Date.now
    
    @Published var name: String = "" {
        didSet {
            lastChanged = Date.now
        }
    }
    
    @Published var background: Drawable = BackgroundColor(color: .white)
}
