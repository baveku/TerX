//
//  MessageItemModel.swift
//  TerX
//
//  Created by Bách on 4/4/20.
//  Copyright © 2020 Bách. All rights reserved.
//

import Foundation
import Combine

struct MessageItemModel: Identifiable {
    var id = UUID().uuidString
    var message: String
}
