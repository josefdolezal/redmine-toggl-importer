//
//  main.swift
//  Importr
//
//  Created by Josef Dolezal on 08/08/2017.
//
//

import Foundation
import Commander
import ImporterKit
import Result
import ReactiveSwift

let main = Group {
    $0.addCommand("login", "sets access tokens for both Redmine and Toggl API", loginCommand)
}

main.run()
