//
//  ApplicationModel.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 02.04.24.
//

import Foundation
import CoreGraphics

class ApplicationModel : ObservableObject {
    @Published var project = AppStoreProject.createNewProject()
    
    var currentImage: CGImage? {
        ImageCache.shared.getImage(of: project.images[0], for: .iPhone16_1)
    }
}
