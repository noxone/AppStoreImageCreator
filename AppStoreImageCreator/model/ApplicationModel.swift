//
//  ApplicationModel.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 02.04.24.
//

import Foundation
import CoreGraphics

class ApplicationModel : ObservableObject {
    @Published var project: AppStoreProject
    
    
    init() {
        self.project = AppStoreProject.createNewProject()
    }
    
    private func set(project: AppStoreProject) {
        self.project = project
    }
    
    func set(background: Background & Renderable) {
    }
    
    var currentImage: CGImage? {
        ImageCache.shared.getImage(of: project.images[0], for: .iPhone16_1)
    }
}

class LoadedImage {
    let id: ImageFileId
    let cgImage: CGImage
    
    init(withId id: ImageFileId, fromAsset name: String) {
        self.id = id
        
    }
}
