//
//  LocationManagerSwiftUIApp.swift
//  LocationManagerSwiftUI
//
//  Created by Ravikanth Thummala on 9/13/23.
//

import SwiftUI

@main
struct LocationManagerSwiftUIApp: App {
    @StateObject private var vm = LocationViewModel()
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
