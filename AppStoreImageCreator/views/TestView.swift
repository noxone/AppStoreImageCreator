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
    
    @State var showInspector = false
    
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
        .inspector(isPresented: $showInspector) {
            Text("Inspector View")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button(action: { showInspector.toggle() }, label: {
                            Label(
                                title: { Text("Toggle Inspector") },
                                icon: { Image(systemName: "sidebar.right") }
                            )
                        })
                    }
                }
        }
    }
}

#Preview {
    TestView()
        .environmentObject(ApplicationModel())
}
