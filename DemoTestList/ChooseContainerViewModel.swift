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
    var containerList :[Container] { demoTestManager.containerList }
    
    @Published var typedName :String = ""
    
    func validateContainerName() -> UUID? {
        if typedName.count > 0 {
            let container = Container (name: typedName)
            demoTestManager.addContainer(withContainer: container)
            typedName = ""
            print("validateContainerName ajout container.name=\(container.name) id=\(container.id.uuidString)")
            return container.id
        }
        return nil
    }
}
