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
    @Published var itemNameValidated :Bool = false
    @Published var clickOnContainer :Bool = false
    @Published var containerNameTyped :String = ""
    
    var titleText :String { editedItem == nil ? "Ajouter item" : "Modifier item"}
    
    func choosenContainerName (fromContainerId choosenContainerId :UUID?) -> String {
        if let id = choosenContainerId {
            return demoTestManager.getContainerName(fromUUID: id)
        } else {
            return "Cliquer pour choisir un container"
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
    
    func validateContainerChoice (withContainerId containerId :UUID) {
        if var item = editedItem {
            objectWillChange.send()
            print ("Item \(item.name) modified with containerId=\(containerId)")
            item.containerId = containerId
            //            choosenContainerId = containerId
            demoTestManager.validateItem(withItem: item)
        } else {
            print ("Error in validateContainerChoice")
        }
    }
}
