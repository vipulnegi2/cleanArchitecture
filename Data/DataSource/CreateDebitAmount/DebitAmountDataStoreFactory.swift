//
//  DebitAmountDataStoreFactory.swift
//  Data
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation

public class DebitAmountDataStoreFactory {
    
    private let api: CreateDebitAmountApi
    
    public init(debitAmountApi: CreateDebitAmountApi) {
        self.api = debitAmountApi
    }
    
    func createCloudDataStore() -> DebitAmountDataStore {
        return CloudDebitAmountDataStore(debitAmountApi: api)
    }
}
