//
//  ProjectImagesView.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 09.04.24.
//

import SwiftUI

struct ProjectImagesView: View {
    @EnvironmentObject private var model: ApplicationModel

    var body: some View {
        ScrollView([.horizontal, .vertical]) {
            VStack {
                ForEach(model.project.activeDevices) { device in
                    DeviceImageStripView(appStoreDevice: device, width: 300)
                }
            }
        }
    }
}

#Preview {
    VStack {
        let model = ApplicationModel()
        ProjectImagesView()
            .environmentObject(model)
    }
}
