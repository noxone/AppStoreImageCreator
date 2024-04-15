//
//  ProjectImageDeviceView.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 09.04.24.
//

import SwiftUI
import SwiftImageReadWrite

struct DeviceImageView: View {
    @EnvironmentObject private var model: ApplicationModel
    var appStoreDevice: AppStoreDevice
    var appStoreImage: AppStoreImage
    var width: CGFloat
    
    var height: CGFloat { width * appStoreDevice.ratio }
    
    private var cgImage: CGImage {
        try! ImageCache.shared.getImage(of: appStoreImage, for: appStoreDevice)
        ?? CGImage.named("dummy-image")
    }
    
    var body: some View {
        ZStack {
            SwiftUI.Color.white
            
            Image(cgImage: cgImage)
                .resizable()
                .scaledToFit()
                .padding(5)
        }
        .frame(width: width, height: height)
    }
}

#Preview {
    VStack {
        let model = ApplicationModel()
        ForEach(model.project.activeDevices) { device in
            DeviceImageView(appStoreDevice: device, appStoreImage: model.project.images[0], width: 300)
                .environmentObject(model)
        }
    }
}
