//
//  TextBox.swift
//  TerX
//
//  Created by Bách on 4/4/20.
//  Copyright © 2020 Bách. All rights reserved.
//

import Foundation
import SwiftUI

struct TextBox: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        HStack {
            Text("Command: ").foregroundColor(Color.white).background(Color.green)
            TextField("",
                  text: $viewModel.cmd,
                  onEditingChanged: { (changed) in
            
                },
                  onCommit:  {
                    self.viewModel.runCommand()
                })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .focusable()
                .multilineTextAlignment(.leading)
                .border(Color.green, width: 1)
        }
    }
}

struct TextBox_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainViewModel()
        return TextBox(viewModel: viewModel).frame(maxWidth: 100, maxHeight: 500)
    }
}
