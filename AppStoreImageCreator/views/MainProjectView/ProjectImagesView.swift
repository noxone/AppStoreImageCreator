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
        Text("Moin")
    }
}

#Preview {
    VStack {
        let model = ApplicationModel()
        ProjectImagesView()
            .environmentObject(model)
    }
}
