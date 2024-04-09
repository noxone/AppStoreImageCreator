//
//  ImageCache.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 31.03.24.
//

import Foundation
import CoreGraphics

class ImageCache {
    static let shared = ImageCache()
    
    private var imageToId = [CacheKey:AppStoreImageId]()
    private var imageToRendering = [CacheKey:CGImage]()
    
    private init() {}
    
    func getImage(of appStoreImage: AppStoreImage, for appStoreDevice: AppStoreDevice) -> CGImage? {
        let cacheKey = CacheKey(imageId: appStoreImage.id, appStoreDevice: appStoreDevice)
        let currentInstanceId = appStoreImage.instanceId
        
        if let lastInstanceId = imageToId[cacheKey], lastInstanceId == currentInstanceId, let rendering = imageToRendering[cacheKey] {
            return rendering
        }
        
        if let image = appStoreImage.render(for: appStoreDevice) {
            imageToId[cacheKey] = currentInstanceId
            imageToRendering[cacheKey] = image
            return image
        }
        
        return nil
    }
    
    private var imageFiles = [ImageFileId: CGImage]()
    
    func put(image: CGImage, withId id: ImageFileId) {
        imageFiles[id] = image
    }
    
    func get(image id: ImageFileId) -> CGImage? {
        return imageFiles[id]
    }
    
    private var screenshots = [ScreenshotId: CGImage]()
    
    func put(screenshot image: CGImage, withId id: ScreenshotId) {
        screenshots[id] = image
    }
    
    func get(screenshot id: ScreenshotId) -> CGImage? {
        return screenshots[id]
    }
    
    private var bezels = [Bezel: CGImage]()
    
    func put(bezel image: CGImage, withId id: Bezel) {
        bezels[id] = image
    }
    
    func get(bezel id: Bezel) -> CGImage? {
        return bezels[id]
    }
}

fileprivate struct CacheKey : Equatable, Hashable {
    let imageId: UUID
    let appStoreDevice: AppStoreDevice
}
