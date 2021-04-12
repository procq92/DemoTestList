//
//  ContainerListView.swift
//  DemoTestList
//
//  Created by Pascal Rocq on 12/04/2021.
//

import SwiftUI

struct ContainerListView: View {
    var demoTestManager :DemoTestManager
    var body: some View {
        List() {
            ForEach (demoTestManager.containerList) {
                container in Text(container.name)
            }
        }
    }
}

struct ContainerListView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerListView(demoTestManager: DemoTestManager())
    }
}
