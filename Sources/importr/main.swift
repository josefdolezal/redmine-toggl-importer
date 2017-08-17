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

let main = command(
    Argument<String>("Redmine Token", description: "The user's personal read/write access token for Redmine API."),
    Argument<String>("Toggl Token", description: "TThe user's personal read/write access token for Toggl API.")
) { redmineToken, togglToken in
    let redmineProvider = RedmineProvider(baseURL: URL(string: "http://redmine.ack.ee")!,
                                          plugins: [RedmineAuthPlugin(token: redmineToken)])
    let togglProvider = TogglProvider(baseURL: URL(string: "https://www.toggl.com/api/v8/")!,
                                      plugins: [TogglAuthPlugin(token: togglToken)])

    redmineProvider.request(.timeEntries).first()?.analysis(ifSuccess: { response in
        print(response)
    }, ifFailure: { error in
        print(error)
    })
}

main.run()
