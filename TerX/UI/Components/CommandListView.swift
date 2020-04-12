//
//  CommandListView.swift
//  TerX
//
//  Created by Bách on 4/4/20.
//  Copyright © 2020 Bách. All rights reserved.
//

import SwiftUI


struct CommandItem: View {
    var text: String = ""
    var body: some View {
        Text(self.text).frame(height: 20)
    }
}
struct CommandListView: View {
    @Binding var results: [MessageItemModel]
    var body: some View {
        GeometryReader { geometry in
            return List(self.results) { result in
                return CommandItem(text: result.message).foregroundColor(.green)
                }.frame(width: geometry.size.width)
        }
    }
}

struct WrapperPreview: View {
    @State var result: [MessageItemModel] = [MessageItemModel.init(message: "ABD")]
    var body: some View {
        return CommandListView(results: $result)
    }
}

struct CommandListView_Previews: PreviewProvider {
    
    static var previews: some View {
        WrapperPreview()
    }
}
