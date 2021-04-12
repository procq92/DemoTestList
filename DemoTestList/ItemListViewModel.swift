//
//  ItemListViewModel.swift
//  DemoTestList
//
//  Created by Pascal Rocq on 06/04/2021.
//

import Foundation

class ItemListViewModel :ObservableObject {
    let demoTestManager :DemoTestManager
    
    @Published var editedItem :Item = Item(name: "")
    
    init (demoTestManager :DemoTestManager) {
        self.demoTestManager = demoTestManager
    }
    
    func getContainerName(fromContainerId containerId:UUID?) -> String {
        return demoTestManager.getContainerName(fromUUID: containerId)
    }
    
    var emptyItem :Item { Item(name: "") }
    var itemList :[Item] { demoTestManager.itemList }
    var sortedItemList :[Item] {
        demoTestManager.itemList.sorted(by: {
                                            (art1, art2) -> Bool in
                                            art1.name < art2.name })}
    
    func validateEditedItem () {
//        if editedItem.name.count != 0 {
//            demoTestManager.addItem(withItem: editedItem)
//        }
    }
}
