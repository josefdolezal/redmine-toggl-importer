//
//  TokenProvider.swift
//  ImporterKit
//
//  Created by Josef Dolezal on 10/09/2017.
//

import Foundation

protocol RedmineTokenProvider {
    var redmineAPIToken: String { get }
}

protocol TogglTokenProvider {
    var togglAPIToken: String { get }
}

struct AuthorizationTokens: RedmineTokenProvider, TogglTokenProvider {
    let redmineAPIToken: String
    var togglAPIToken: String
}
