//
//  ProjectImageStripView.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 09.04.24.
//

import SwiftUI

struct ProjectImageStripView: View {
    @EnvironmentObject private var model: ApplicationModel
    var appStoreDevice: AppStoreDevice

    var body: some View {
        ScrollView([.horizontal, .vertical]) {
            HStack {
                ForEach(model.project.images) { image in
                    ProjectImageDeviceView(appStoreDevice: appStoreDevice, appStoreImage: image)
                }
            }.frame(width: 2000, height: 1000)
        }.frame(maxWidth: .infinity)
    }
}

#Preview {
    VStack {
        let model = ApplicationModel()
        ForEach(model.project.activeDevices) { device in
            ProjectImageStripView(appStoreDevice: device)
        }
        .environmentObject(model)
    }
}
