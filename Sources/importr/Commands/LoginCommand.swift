//
//  LoginCommand.swift
//  importr
//
//  Created by Josef Dolezal on 10/09/2017.
//

import Foundation
import Commander
import ImporterKit

struct NoResponseFromServer: Error, CustomStringConvertible {
    var description: String { return localizedDescription }

    var localizedDescription: String { return "The server did not responded in expected time. Aborting." }
}

let loginCommand = command { (redmineToken: String, togglToken: String) in
    let redmineProvider = RedmineProvider(baseURL: URL(string: "https://redmine.ack.ee")!,
                                          plugins: [RedmineAuthPlugin(token: redmineToken)])
    let togglProvider = TogglProvider(baseURL: URL(string: "https://www.toggl.com/api/v8/")!, plugins: [TogglAuthPlugin(token: togglToken)])

    let redmineService = RedmineService(provider: redmineProvider)
    let togglService = TogglService(provider: togglProvider)

    _ = try redmineService.validateAccessToken().first().requireSuccess()
    _ = try togglService.validateAccessToken().first().requireSuccess()
}
