//
//  ChooseContainerViewModel.swift
//  DemoTestList
//
//  Created by Pascal Rocq on 07/04/2021.
//

import Foundation

class ChooseContainerViewModel : ObservableObject {
    let demoTestManager :DemoTestManager
    
    init (demoTestManager :DemoTestManager) {
        self.demoTestManager = demoTestManager
    }
//    var containerList :[Container] { demoTestManager.containerList }
}
