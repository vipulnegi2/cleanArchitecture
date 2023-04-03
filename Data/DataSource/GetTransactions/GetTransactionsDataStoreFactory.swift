//
//  GetTransactionDataStoreFactory.swift
//  Data
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation

import Foundation

public class GetTransactionDataStoreFactory {
    
    private let api: GetTransactionApi
    
    public init(getTransaction: GetTransactionApi) {
        self.api = getTransaction
    }
    
    func createCloudDataStore() -> GetTransactionsDataStore {
        return CloudTransactionsDataStore(getTransactionsApi: api)
    }
}
