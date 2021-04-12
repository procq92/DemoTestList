//
//  Item.swift
//  DemoTestList
//
//  Created by Pascal Rocq on 06/04/2021.
//

import Foundation

struct Item :Identifiable {
    var id :UUID = UUID()
    var name :String
    var containerId:UUID?
}

