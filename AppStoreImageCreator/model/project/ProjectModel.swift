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

