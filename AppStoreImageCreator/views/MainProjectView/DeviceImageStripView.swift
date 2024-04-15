//
//  DeviceImageStripView.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 15.04.24.
//

import SwiftUI

struct DeviceImageStripView: View {
    @EnvironmentObject private var model: ApplicationModel
    var appStoreDevice: AppStoreDevice
    var width: CGFloat
    
    var body: some View {
        HStack {
            ForEach(model.project.images) { image in
                DeviceImageView(appStoreDevice: appStoreDevice, appStoreImage: image, width: width)
            }
        }
    }
}

#Preview {
    VStack {
        let model = ApplicationModel()
        DeviceImageStripView(appStoreDevice: model.project.activeDevices[0], width: 300)
            .environmentObject(model)
        DeviceImageStripView(appStoreDevice: model.project.activeDevices[1], width: 250)
            .environmentObject(model)
    }
}
