//
//  ProjectImageDeviceView.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 09.04.24.
//

import SwiftUI
import SwiftImageReadWrite

struct ProjectImageDeviceView: View {
    @EnvironmentObject private var model: ApplicationModel
    var appStoreImageIndex: Int
    var appStoreDeviceIndex: Int
    
    private var appStoreImage: AppStoreImage {
        model.project.images[appStoreImageIndex]
    }
    private var appStoreDevice: AppStoreDevice {
        model.project.activeDevices[appStoreDeviceIndex]
    }
    
    private var cgImage: CGImage {
        try! ImageCache.shared.getImage(of: appStoreImage, for: appStoreDevice)
        ?? CGImage.named("dummy-image")
    }
    
    var body: some View {
        GeometryReader { ruler in
            let size = min(ruler.size.width, ruler.size.height)
            ZStack {
                SwiftUI.Color.white
                
                Image(cgImage: cgImage)
                    .resizable()
                    .scaledToFit()
                    .padding(5)
            }
            .frame(width: size, height: size)
        }
    }
}

#Preview {
    VStack {
        ProjectImageDeviceView(appStoreImageIndex: 0, appStoreDeviceIndex: 0)
            .environmentObject(ApplicationModel())
            .frame(width: 300, height: 300)
        ProjectImageDeviceView(appStoreImageIndex: 0, appStoreDeviceIndex: 1)
            .environmentObject(ApplicationModel())
            .frame(width: 300, height: 400)
    }
}
