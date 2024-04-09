//
//  ProjectModel.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 30.03.24.
//

import Foundation

typealias AppStoreImageId = Int
typealias ScreenshotId = UUID
typealias ImageFileId = UUID

struct AppStoreProject {
    let createdOn: Date = Date.now
    let name: String
    let background: Renderable & Background
    let images: [AppStoreImage]
    let activeDevices: [AppStoreDevice]
    let imagesFiles: [ImageFile]
    let screenshots: [Screenshot]
}

struct AppStoreImage {
    private static var currentId = 0
    let instanceId: AppStoreImageId = { currentId += 1; return currentId }()
    let id: UUID
    let background: Renderable & Background
    let elements: [Renderable]
}

struct Screenshot {
    let id: ScreenshotId
    let images: [AppStoreDevice:ImageFileId]
}

struct ImageFile {
    let id: ImageFileId
    let originalFilename: String?
}

extension AppStoreProject {
    private static var creationCounter = 1
    static func createNewProject() -> AppStoreProject {
        let name = "Project #\(creationCounter)"
        
        let id1 = ImageFileId()
        
        creationCounter += 1
        return AppStoreProject(
            name: name,
            background: BackgroundColor(color: .init(red: 1, green: 1, blue: 1, alpha: 1)),
            images: [
                AppStoreImage(
                    id: UUID(),
                    //background: BackgroundColor(color: Color(red: 0.7, green: 0.5)),
                    //background: LinearGradient(rotationAngle: 10, colors: [Color(green: 0), Color(red:1.0), Color(blue: 1.0)], stops: [0.19, 0.29, 1.0]),
                    background: SimpleLinearGradient(rotationAngle: -25, color0: Color(green: 1), color1: Color(red:1.0)),
                    elements: [
                        TextElement(color: Color(blue: 1.0), fontName: "Helvetica Neue", fontSize: 36, text: "This is a first test!", position: CGPoint(x: 0.6, y: 0.15), underline: false, rotationAngle: 7.0),
                        ImageFileElement(imageId: id1, scale: CGPoint(x: 0.2, y: 0.2), position: CGPoint(x: 0.3, y: 0.65), rotationAngle: -10),
                    ]
                )
            ],
            activeDevices: [.iPadPro11_0, .iPhone6_7],
            imagesFiles: [
                ImageFile(id: id1, originalFilename: "test-lightscape")
            ],
            screenshots: []
        )
    }
}

