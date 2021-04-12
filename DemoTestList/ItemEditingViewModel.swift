//
//  ItemEditingViewModel.swift
//  DemoTestList
//
//  Created by Pascal Rocq on 06/04/2021.
//

import Foundation

class ItemEditingViewModel :ObservableObject {
    let demoTestManager :DemoTestManager
    
    init (demoTestManager :DemoTestManager) {
        print("init ItemEditingViewModel")
        self.demoTestManager = demoTestManager
    }
    
    var containerList :[Container] { demoTestManager.containerList }
    
    //    @Published var choosenContainerId :UUID?
    @Published var editedItem :Item?
    @Published var clickOnContainer :Bool = false
    @Published var containerNameTyped :String = ""
        
    func choosenContainerName (fromContainerId choosenContainerId :UUID?) -> String {
        if let id = choosenContainerId {
            return demoTestManager.getContainerName(fromUUID: id)
        } else {
            return "Click to choose a container"
        }
    }
    
    func validateItem () {
        if let item = editedItem {
            if item.name.count != 0 {
                demoTestManager.validateItem(withItem: item)
            }
        }
    }
    
    func validateContainerChoice () {
        if containerNameTyped != "" {
            if let containerId = demoTestManager.getId(ofContainerName: containerNameTyped) {
                editedItem?.containerId = containerId
            } else {
                let container = Container(name: containerNameTyped)
                demoTestManager.addContainer(withContainer: container)
                editedItem?.containerId = container.id
            }
        } else {
            print("validateContainerChoice -> empty containerNameTyped")
        }
    }
}
