//
//  CreditAmountDataStoreFactory.swift
//  Data
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation

public class GetBalanceDataStoreFactory {
    
    private let api: GetBalanceApi
    
    public init(getBalance: GetBalanceApi) {
        self.api = getBalance
    }
    
    func createCloudDataStore() -> GetBalanceDataStore {
        return CloudBalanceDataStore(getBalanceApi: api)
    }
}
