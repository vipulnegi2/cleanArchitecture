//
//  GetBalanceRepository.swift
//  Domain
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation
import Domain

public final class DefaultGetBalanceRepository: GetBalanceRepository {
    
    private let factory: GetBalanceDataStoreFactory
    
    public init(getBalanceDataStoreFactory: GetBalanceDataStoreFactory) {
        self.factory = getBalanceDataStoreFactory
    }
    
    public func getBalance(completion: @escaping (Result<BalanceEntity, Error>) -> Void) {
        let dataStore: GetBalanceDataStore = factory.createCloudDataStore()
        dataStore.getBalance(completion: completion)
    }
}
