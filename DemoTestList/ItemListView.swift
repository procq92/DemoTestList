//
//  ItemListView.swift
//  DemoTestList
//
//  Created by Pascal Rocq on 06/04/2021.
//

import SwiftUI

struct ItemListView: View {
    @ObservedObject var viewModel :ItemListViewModel
    
    init (demoTestManager :DemoTestManager) {
        viewModel = ItemListViewModel(demoTestManager: demoTestManager)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink("container", destination: ContainerListView(demoTestManager: viewModel.demoTestManager))
                    Spacer()
                    NavigationLink("Add +", destination: ItemEditingView(demoTestManager: viewModel.demoTestManager, editedItem: $viewModel.editedItem)
                                    .onAppear(perform: {
                                        viewModel.editedItem = viewModel.emptyItem
                                    })
                                    .onDisappear(perform: {
                                        viewModel.validateEditedItem()
                                    }))
                }
                Spacer()
                if viewModel.demoTestManager.itemList.count != 0 {
                    List() {
                        ForEach (viewModel.sortedItemList) {
                            item in
                            NavigationLink(destination: ItemEditingView(demoTestManager: viewModel.demoTestManager, editedItem :$viewModel.editedItem)
                                            .onAppear(perform: {
                                                viewModel.editedItem = item
                                            })
                                            .onDisappear(perform: {
                                                viewModel.validateEditedItem()
                                            })) {
                                HStack {
                                    Text (item.name)
                                            .font(.title3)
                                            .padding(.horizontal)
                                            .padding(.vertical, 2.0)
                                    Spacer()
                                    Text(viewModel.getContainerName(fromContainerId: item.containerId))
                                        .italic()
                                        .font(.caption2)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                else {
                    Text("Pas d'item...")
                        .italic()
                        .foregroundColor(.secondary)
                        .padding(.vertical, 7.0)
                        .padding(.horizontal)
                }
//                let texteAvecAccents = "éèçÇàÉÈÇÀàÎÏîïôöÔÖÙÛÜùûüìâäÂÄ"
//                Text(texteAvecAccents)
//                Text(texteAvecAccents.folding(options: [.widthInsensitive], locale: nil))
//                Text(texteAvecAccents.folding(options: [.caseInsensitive], locale: nil))
//                Text(texteAvecAccents.folding(options: [.diacriticInsensitive], locale: nil))
//                Text(texteAvecAccents.folding(options: [.diacriticInsensitive,.caseInsensitive], locale: nil))

                Spacer()
            }.navigationTitle("Liste des items")
        }
        
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(demoTestManager: DemoTestManager())
    }
}

