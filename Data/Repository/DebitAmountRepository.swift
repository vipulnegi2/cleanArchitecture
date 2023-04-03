//
//  DebitAmountRepository.swift
//  Domain
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation
import Domain

public final class DefaultDebitAmountRepository: DebitAmountRepository {
   
    private let factory: DebitAmountDataStoreFactory
    
    public init(debitAmountDataStoreFactory: DebitAmountDataStoreFactory) {
        self.factory = debitAmountDataStoreFactory
    }
    
    public func debitAmount(parameters: [String : Any], completion: @escaping (Result<CommonResponse, Error>) -> Void) {
        let dataStore: DebitAmountDataStore = factory.createCloudDataStore()
        return dataStore.debitAmount(parameters: parameters, completion: completion)
    }
}
