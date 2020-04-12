//
//  MainViewModel.swift
//  TerX
//
//  Created by Bách on 4/4/20.
//  Copyright © 2020 Bách. All rights reserved.
//

import Foundation
import Combine

class MainViewModel: ObservableObject, Identifiable, CommandLineWorkerProtocol {
    
    
    private let worker = CommandLineWorker()
    
    @Published var dataSource: [MessageItemModel] = []
    @Published var cmd: String = ""
    
    init() {
        self.worker.delegate = self
    }
    
    func runCommand() {
        print(self.cmd)
        guard !cmd.isEmpty else {return}
        self.worker.setCmd(self.cmd).excute()
    }
    
    func worker(_ w: CommandLineWorker, output: CommandlineOutput) {
        print(output)
        self.dataSource = output.map({MessageItemModel.init(message: $0)})
    }
}
