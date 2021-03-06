//
//  DemoTestListApp.swift
//  DemoTestList
//
//  Created by Pascal Rocq on 06/04/2021.
//

import SwiftUI

@main
struct DemoTestListApp: App {
    @ObservedObject var demoTestManager = DemoTestManager()
    var body: some Scene {
        WindowGroup {
            ItemListView(demoTestManager: demoTestManager)
        }
    }
}
