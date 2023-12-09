//
//  DoctorAppApp.swift
//  DoctorApp
//
//  Created by Asya Checkanar on 07.12.2023.
//

import SwiftUI

@main
struct DoctorAppApp: App {
    
    @StateObject private var viewModel = DoctorListViewModel()
    
    var body: some Scene {
        WindowGroup {
            DoctorListView()
                .environmentObject(viewModel)
        }
    }
}
