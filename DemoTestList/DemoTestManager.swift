//
//  DemoTestManager.swift
//  DemoTestList
//
//  Created by Pascal Rocq on 06/04/2021.
//

import Foundation

class DemoTestManager :ObservableObject {
    
    @Published var itemList :[Item] = [] // ne pas enlever published sinon KO
    @Published var containerList :[Container] = []  // si on ajoute published KO
    
    func getIndex (fromItemId id:UUID) -> Int? {
        return itemList.firstIndex(where: { (art) -> Bool in
                                        art.id == id  })
    }
    
    func validateItem(withItem item :Item) {
        if let index = getIndex(fromItemId: item.id) {
            // item.id founded => modifying existing item
            itemList[index].name = item.name
            itemList[index].containerId = item.containerId
        } else {
            //item.id not found => new item
            itemList.append(item)
        }
    }
    
    func addContainer(withContainer container :Container) {
//        objectWillChange.send()
        containerList.append(container)
    }
    
    func getId (ofContainerName name :String) -> UUID? {
        let container = containerList.first { (cntnr) -> Bool in
            cntnr.name == name
        }
        return container?.id ?? nil
    }
    
    func getContainerName (fromUUID containerId: UUID?) -> String {
        if let id = containerId {
            if let containerFounded = containerList.first(where: { (container) -> Bool in
                container.id == id
            }) {
                return containerFounded.name
            } else {
                return ("ContainerId not found")
            }
        }
        else {
            return ("--")
        }
    }
}
