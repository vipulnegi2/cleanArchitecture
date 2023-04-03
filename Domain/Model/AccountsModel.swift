//
//  AccountsModel.swift
//  AccountsApp_SwiftUI
//
//  Created by Neha Penkalkar on 28/07/22.
//

import Foundation

public struct AccountsModel: Codable { //Request
    public var transactionType: String?
    public var amount: Int?
    public var title: String?
    
    public init(transactionType: String?, amount: Int?, title: String?) {
        self.transactionType = transactionType
        self.amount = amount
        self.title = title
    }
}
