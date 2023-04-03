//
//  CreditAmountDataStoreFactory.swift
//  Data
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation

public class CreditAmountDataStoreFactory {
    
    private let api: CreateCreditAmountApi
    
    public init(creditAmountApi: CreateCreditAmountApi) {
        self.api = creditAmountApi
    }
    
    func createCloudDataStore() -> CreditAmountDataStore {
        return CloudCreditAmountDataStore(creditAmountApi: api)
    }
}
