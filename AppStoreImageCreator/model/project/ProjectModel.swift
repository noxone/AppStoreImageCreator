//
//  ProjectModel.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 30.03.24.
//

import Foundation

struct AppStoreProject {
    let createdOn: Date = Date.now
    let name: String
    let background: Renderable & Background
    let images: [AppStoreImage]
    let activeDevices: [Device]
}

struct Screenshot {
    let id: UUID
}

typealias AppStoreImageId = Int

struct AppStoreImage {
    private static var currentId = 0
    let instanceId: AppStoreImageId = { currentId += 1; return currentId }()
    let id: UUID
    let background: Renderable & Background
    let elements: [Renderable]
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
            activeDevices: [.iPhone16_2]
        )
    }
}
