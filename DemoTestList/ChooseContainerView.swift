//
//  ChooseContainerView.swift
//  DemoTestList
//
//  Created by Pascal Rocq on 07/04/2021.
//

import SwiftUI

struct ChooseContainerView: View {
    @ObservedObject var viewModel :ChooseContainerViewModel
    @Binding var containerName:String
    @Binding var showContainerChoiceView :Bool
    var containerList :[Container]?

    init (demoTestManager :DemoTestManager, choosenContainerName:Binding<String>, showContainerChoice :Binding<Bool>, containerList :[Container]?) {
        self._containerName = choosenContainerName
        viewModel = ChooseContainerViewModel(demoTestManager: demoTestManager)
        self._showContainerChoiceView = showContainerChoice
        self.containerList = containerList
    }
    
    var body: some View {
        VStack {
            TextField(NSLocalizedString("Add a container", comment: ""),
                      text: $containerName
                      , onCommit: { showContainerChoiceView = false }
                      //                      , onCommit: { containerId = viewModel.validateContainerName() }
            )
            .autocapitalization(.sentences)
            .disableAutocorrection(true)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 200, height: 30, alignment: .leading)
            List () {
                ForEach (viewModel.demoTestManager.containerList.sorted(by: { $0.name < $1.name })) { container in
                    Text ("\(container.name)")
                        .onTapGesture {
                            containerName = container.name
                            showContainerChoiceView = false
                        }
                }
            }.frame(width: 150, height: 300)
        }
    }
}

struct ChooseContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseContainerView(demoTestManager: DemoTestManager(),  choosenContainerName: .constant("toto"), showContainerChoice: .constant(true), containerList: nil)
    }
}
