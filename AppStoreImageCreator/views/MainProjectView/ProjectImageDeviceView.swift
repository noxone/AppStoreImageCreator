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
    var appStoreDevice: AppStoreDevice
    var appStoreImage: AppStoreImage
    
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
        let model = ApplicationModel()
        ForEach(model.project.activeDevices) { device in
            ProjectImageDeviceView(appStoreDevice: device, appStoreImage: model.project.images[0])
                .environmentObject(model)
                .frame(width: 300, height: 300)
        }
    }
}
