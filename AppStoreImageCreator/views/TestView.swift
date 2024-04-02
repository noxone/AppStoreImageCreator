//
//  TestView.swift
//  AppStoreImageCreator
//
//  Created by Olaf Neumann on 31.03.24.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject
    private var model: ApplicationModel
    
    var body: some View {
        VStack {
            Text(model.project.name)
            if let cgImage = model.currentImage {
                Image(cgImage: cgImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Text("No Image")
            }
        }
    }
}

#Preview {
    TestView()
        .environmentObject(ApplicationModel())
}
