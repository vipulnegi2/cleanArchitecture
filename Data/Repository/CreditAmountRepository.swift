//
//  CreditAmountRepository.swift
//  Domain
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation
import Domain

public final class DefaultCreditAmountRepository: CreditAmountRepository {
   
    private let factory: CreditAmountDataStoreFactory
    
    public init(creditAmountDataStoreFactory: CreditAmountDataStoreFactory) {
        self.factory = creditAmountDataStoreFactory
    }
    
    public func creditAmount(parameters: [String : Any], completion: @escaping (Result<CommonResponse, Error>) -> Void) {
        let dataStore: CreditAmountDataStore = factory.createCloudDataStore()
        return dataStore.creditAmount(parameters: parameters, completion: completion)
    }
}
