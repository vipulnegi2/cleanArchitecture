//
//  TransactionsEntity.swift
//  Domain
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation

// MARK: - TransactionsEntity
public struct TransactionsEntity: Codable {
    public var transactions: [TransactionsData]?
}

// MARK: - TransactionsData
public struct TransactionsData: Codable, Hashable {// TransactionModel
    public var amount: Int?
    public var transactionAmount: Int?
    public var type: String?
    public var title: String?
    public var time: String?
    public var id: String?
}
