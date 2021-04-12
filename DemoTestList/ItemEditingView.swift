//
//  ItemEditingView.swift
//  DemoTestList
//
//  Created by Pascal Rocq on 06/04/2021.
//

import SwiftUI

struct ItemEditingView: View {
    @ObservedObject var viewModel :ItemEditingViewModel
    @Binding var editedItem :Item
    
    init (demoTestManager :DemoTestManager, editedItem :Binding<Item>) {
        viewModel = ItemEditingViewModel(demoTestManager: demoTestManager)
        self._editedItem = editedItem
        print("init ItemEditingView name=\(self.editedItem.name) id=\(self.editedItem.id.uuidString)")
        viewModel.editedItem = self.editedItem
        print("init ItemEditingView self.editedItem.name=\(self.editedItem.name) id=\(self.editedItem.id.uuidString)")
    }
    
    var body: some View {
        VStack {
            TextField(NSLocalizedString("Item name", comment: ""),
                      text: $editedItem.name,
                      onCommit: { viewModel.editedItem!.name = editedItem.name })
                .autocapitalization(.sentences)
                .disableAutocorrection(true)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300, height: 30, alignment: .leading)
            Text(viewModel.choosenContainerName(fromContainerId: viewModel.editedItem?.containerId))
                .padding(.horizontal)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300, height: 40, alignment: .leading)
                .autocapitalization(.sentences)
                .disableAutocorrection(true)
                .onTapGesture {
                    viewModel.clickOnContainer = true
                }
                .background(Color(.white))
//            let texte = "editedItem.containerId=\(viewModel.editedItem?.containerId?.uuidString ?? "nil")"
//            Text(texte)
//                .font(.caption2)
//                .padding(.bottom)
            if viewModel.clickOnContainer {
                ChooseContainerView(demoTestManager: viewModel.demoTestManager, choosenContainerName: $viewModel.containerNameTyped, showContainerChoice: $viewModel.clickOnContainer, containerList: viewModel.demoTestManager.containerList)
                    .onDisappear(perform: viewModel.validateContainerChoice)
//                Text("container : id=\(viewModel.editedItem?.containerId?.uuidString ?? "nil")").font(.caption2)
            }
//            let texte2 = "editedItem.id=\(viewModel.editedItem?.id.uuidString ?? "nil")"
//            Text(texte2).font(.caption2)
            Spacer()
        }.navigationTitle("Edit Item...").onDisappear( perform: viewModel.validateItem)
    }
}

struct ItemEditingView_Previews: PreviewProvider {
    static var previews: some View {
        let item = Item(name: "toto")
        ItemEditingView(demoTestManager: DemoTestManager(), editedItem: .constant(item))
    }
}
