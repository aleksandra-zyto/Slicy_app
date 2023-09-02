//
//  SlicyApp.swift
//  Slicy
//
//  Created by Ola Żyto on 24/08/2023.
//

import SwiftUI
import IQKeyboardManagerSwift


@main
struct SlicyApp: App {
    init() {
            // Configure IQKeyboardManager
            IQKeyboardManager.shared.enable = true
            // You can configure more options here if needed
        }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
