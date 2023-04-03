//
//  GetTransactionsDataStore.swift
//  Data
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation
import Domain

protocol GetTransactionsDataStore {
    func getTransactions(completion: @escaping (Result<TransactionsEntity, Error>) -> Void)
}

class CloudTransactionsDataStore: GetTransactionsDataStore {

    private let api: GetTransactionApi
    
    init(getTransactionsApi: GetTransactionApi) {
        self.api = getTransactionsApi
    }
    
    func getTransactions(completion: @escaping (Result<TransactionsEntity, Error>) -> Void) {
        return api.getTransactions(completion: completion)
    }
}
