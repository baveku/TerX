//
//  CommandLineRunner.swift
//  TerX
//
//  Created by Bách on 4/4/20.
//  Copyright © 2020 Bách. All rights reserved.
//

import Foundation

typealias CommandlineError = [String]
typealias CommandlineOutput = [String]

protocol CommandLineRunnerDelegate: class {
    func commandline(runner: CommandLineRunner, onError: CommandlineError)
    func commandLine(runner: CommandLineRunner, output: CommandlineOutput)
}


class CommandLineRunner {
    weak var delegate: CommandLineRunnerDelegate? = nil
    
    let fileManager = FileManager.default
    let id = UUID().uuidString

    func runCommand(args: [String]) {

        var output : [String] = []
        var error : [String] = []

        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = args

        let outpipe = Pipe()
        task.standardOutput = outpipe
        let errpipe = Pipe()
        task.standardError = errpipe

        task.launch()

        let outdata = outpipe.fileHandleForReading.readDataToEndOfFile()
        if var string = String(data: outdata, encoding: .utf8) {
            string = string.trimmingCharacters(in: .newlines)
            output = string.components(separatedBy: "\n")
            delegate?.commandLine(runner: self, output: output)
        }

        let errdata = errpipe.fileHandleForReading.readDataToEndOfFile()
        if var string = String(data: errdata, encoding: .utf8) {
            string = string.trimmingCharacters(in: .newlines)
            error = string.components(separatedBy: "\n")
            delegate?.commandline(runner: self, onError: error)
        }

        task.waitUntilExit()
    }
}

