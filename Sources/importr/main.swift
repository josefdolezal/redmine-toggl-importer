//
//  main.swift
//  Importr
//
//  Created by Josef Dolezal on 08/08/2017.
//
//

import Commander

let main = command(
    Argument<String>("Redmine Token", description: "The user's personal read/write access token for Redmine API."),
    Argument<String>("Toggl Token", description: "TThe user's personal read/write access token for Toggl API.")
) { redmineToken, togglToken in
    print("Your Redmine Token: \(redmineToken)")
    print("Your Toggl Token: \(togglToken)")
}

main.run()
