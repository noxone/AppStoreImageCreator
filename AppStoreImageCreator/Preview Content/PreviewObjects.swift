//
//  PreviewObjects.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 09.04.24.
//

import Foundation

extension AppStoreProject {
    private static var creationCounter = 1
    
    static func createNewProject() -> AppStoreProject {
        let name = "Project #\(creationCounter)"
        
        let id1 = ImageFileId()
        let id2 = ImageFileId()
        let sid1 = ScreenshotId()
        
        creationCounter += 1
        return AppStoreProject(
            name: name,
            background: BackgroundColor(color: .init(red: 1, green: 1, blue: 1, alpha: 1)),
            images: [
                AppStoreImage(
                    id: UUID(),
                    //background: BackgroundColor(color: Color(red: 0.7, green: 0.5)),
                    //background: LinearGradient(rotationAngle: 10, colors: [Color(green: 0), Color(red:1.0), Color(blue: 1.0)], stops: [0.19, 0.29, 1.0]),
                    background: SimpleLinearGradient(rotationAngle: -25, color0: Color(red: 1), color1: Color(green: 0.2, blue:0.4)),
                    elements: [
                        TextElement(color: Color(blue: 1.0), fontName: "Helvetica Neue", fontSize: 36, text: "This is a first test!", position: CGPoint(x: 0.6, y: 0.15), underline: false, rotationAngle: 6),
                        ImageFileElement(imageId: id1, scale: CGSize(width: 0.2, height: 0.2), position: CGPoint(x: 0.3, y: 0.65), rotationAngle: -15),
                        ScreenshotElement(screenshot: id1, bezel: .iPad_Pro_11, imageScale: .scale, scale: CGSize(width: 0.5, height: 0.5), position: CGPoint(x: 0.7, y: 0.45), rotationAngle: 10),
                    ]
                )
            ],
            activeDevices: [.iPadPro11_0, .iPhone6_7, ],
            imagesFiles: [
                ImageFile(id: id1, originalFilename: "test-lightscape"),
                ImageFile(id: id2, originalFilename: "test-screenshot-ipad")
            ],
            screenshots: [
                Screenshot(id: sid1, images: [.iPadPro11_0: id2])
            ]
        )
    }
}

extension AppStoreImage {
    static func createNewImage(id1: UUID) -> AppStoreImage {
        AppStoreImage(
            id: UUID(),
            //background: BackgroundColor(color: Color(red: 0.7, green: 0.5)),
            //background: LinearGradient(rotationAngle: 10, colors: [Color(green: 0), Color(red:1.0), Color(blue: 1.0)], stops: [0.19, 0.29, 1.0]),
            background: SimpleLinearGradient(rotationAngle: -25, color0: Color(green: 1), color1: Color(red:1.0)),
            elements: [
                TextElement(color: Color(blue: 1.0), fontName: "Helvetica Neue", fontSize: 36, text: "This is a first test!", position: CGPoint(x: 0.6, y: 0.15), underline: false, rotationAngle: 6),
                ImageFileElement(imageId: id1, scale: CGSize(width: 0.2, height: 0.2), position: CGPoint(x: 0.3, y: 0.65), rotationAngle: -15),
                ScreenshotElement(screenshot: id1, bezel: .iPad_Pro_11, imageScale: .scale, scale: CGSize(width: 0.5, height: 0.5), position: CGPoint(x: 0.7, y: 0.45), rotationAngle: 10),
            ]
        )
    }
}
