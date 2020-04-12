//
//  CommandLineWorker.swift
//  TerX
//
//  Created by Bách on 4/4/20.
//  Copyright © 2020 Bách. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct Argument {
    let param: String
}

struct Command {
    let cmd: String
}

protocol CommandLineWorkerProtocol: class {
    func worker(_ w: CommandLineWorker, output: CommandlineOutput)
}

class CommandLineWorker: CommandLineRunnerDelegate {
    func commandline(runner: CommandLineRunner, onError: CommandlineError) {
        // MARK: Handle Error
    }
    
    func commandLine(runner: CommandLineRunner, output: CommandlineOutput) {
        self.delegate?.worker(self, output: output)
    }
    
    private var runner: CommandLineRunner = .init()
    weak var delegate: CommandLineWorkerProtocol? = nil
    var cmd: Command = .init(cmd: "")
    var args: [Argument] = []
    init() {
        runner.delegate = self
    }
    
    func addArg(_ arg: String) {
        self.args.append(.init(param: arg))
    }
    
    func setCmd(_ cmd: String) -> CommandLineWorker {
        self.cmd = .init(cmd: cmd)
        return self
    }
    
    func excute() {
        self.runner.runCommand(args: self.cmd.cmd.split(separator: " ").map({String($0)}))
    }
}
