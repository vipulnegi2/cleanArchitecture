//
//  AccountsApp_SwiftUIApp.swift
//  AccountsApp_SwiftUI
//
//  Created by Neha Penkalkar on 28/07/22.
//

import SwiftUI

@main
struct AccountsApp_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            AccountsView(getTransactionViewModel: FetchTransactionViewModel(),
                         getBalanceViewModel: GetBalanceViewModel())
        }
    }
}
