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
    
    func getImage(of appStoreImage: AppStoreImage, for device: Device) -> CGImage? {
        let cacheKey = CacheKey(imageId: appStoreImage.id, device: device)
        let currentInstanceId = appStoreImage.instanceId
        
        if let lastInstanceId = imageToId[cacheKey], lastInstanceId == currentInstanceId, let rendering = imageToRendering[cacheKey] {
            return rendering
        }
        
        if let image = appStoreImage.render(for: device) {
            imageToId[cacheKey] = currentInstanceId
            imageToRendering[cacheKey] = image
            return image
        }
        
        return nil
    }
}

fileprivate struct CacheKey : Equatable, Hashable {
    let imageId: UUID
    let device: Device
}
