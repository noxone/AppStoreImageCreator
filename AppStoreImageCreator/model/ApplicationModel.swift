//
//  ApplicationModel.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 02.04.24.
//

import Foundation
import CoreGraphics
import SwiftImageReadWrite

class ApplicationModel : ObservableObject {
    @Published var project: AppStoreProject
    
    init() {
        self.project = AppStoreProject.createNewProject()
        loadImage(imagefile: project.imagesFiles[0])
        loadBezels()
    }
    
    private func set(project: AppStoreProject) {
        self.project = project
    }
    
    private func loadBezels() {
        for bezel in Bezel.allCases {
            if let bezelImage = bezel.image {
                ImageCache.shared.put(bezel: bezelImage, withId: bezel)
            }
        }
    }
    
    func set(background: Background & Renderable) {
    }
    
    func loadImage(imagefile: ImageFile) {
        let id = imagefile.id
        if let image = LoadedImage(withId: id, named: imagefile.originalFilename!) {
            ImageCache.shared.put(image: image.cgImage, withId: id)
        }
    }
    
    var currentImage: CGImage? {
        ImageCache.shared.getImage(of: project.images[0], for: project.activeDevices.first!)
    }
}

class LoadedImage {
    let id: ImageFileId
    let cgImage: CGImage
    
    init?(withId id: ImageFileId, named name: String) {
        self.id = id
        if let image = SwiftImageReadWrite.PlatformImage(named: name),
           let cgImage = image.cgImage {
            self.cgImage = cgImage
        } else {
            return nil
        }
    }
}

enum AppStoreImageCreatorError : LocalizedError {
    case unableToLoadImageFromAsset(name: String)
}
