//
//  GetTransactionRepository.swift
//  Domain
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation
import Domain

public final class DefaultGetTransactionRepository: GetTransactionRepository {
    private let factory: GetTransactionDataStoreFactory
    
    public init(getTransactionDataStoreFactory: GetTransactionDataStoreFactory) {
        self.factory = getTransactionDataStoreFactory
    }
    
    public func getTransactions(completion: @escaping (Result<TransactionsEntity, Error>) -> Void) {
        let dataStore: GetTransactionsDataStore = factory.createCloudDataStore()
        dataStore.getTransactions(completion: completion)
    }
}
