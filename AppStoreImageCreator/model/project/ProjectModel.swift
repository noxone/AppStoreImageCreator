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
    let activeDevices: [Device]
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
    let images: [Device:ImageFileId]
}

struct ImageFile {
    let id: ImageFileId
    let originalFilename: String?
}

extension AppStoreProject {
    private static var creationCounter = 1
    static func createNewProject() -> AppStoreProject {
        let name = "Project #\(creationCounter)"
        creationCounter += 1
        return AppStoreProject(
            name: name,
            background: BackgroundColor(color: .init(red: 1, green: 1, blue: 1, alpha: 1)),
            images: [
                AppStoreImage(id: UUID(), background: BackgroundColor(color: Color(green: 1)), elements: [
                    TextElement(color: Color(blue: 1.0), fontName: "Helvetica", fontSize: 36, text: "This is a first test!", position: CGPoint(x: 0.5, y: 0.5), underline: true, rotationAngle: 0.0)
                ])
            ],
            activeDevices: [.iPhone16_2],
            imagesFiles: [],
            screenshots: []
        )
    }
}
