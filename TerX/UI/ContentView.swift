//
//  ContentView.swift
//  TerX
//
//  Created by Bách on 4/4/20.
//  Copyright © 2020 Bách. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = MainViewModel()
    var body: some View {
        VStack {
            CommandListView(results: $viewModel.dataSource).background(Color.blue)
            TextBox(viewModel: viewModel)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
