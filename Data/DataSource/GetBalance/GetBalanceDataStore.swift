//
//  GetBalanceDataStore.swift
//  Data
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation
import Domain

protocol GetBalanceDataStore {
    func getBalance(completion: @escaping (Result<BalanceEntity, Error>) -> Void)
}

class CloudBalanceDataStore: GetBalanceDataStore {

    private let api: GetBalanceApi
    
    init(getBalanceApi: GetBalanceApi) {
        self.api = getBalanceApi
    }
    
    func getBalance(completion: @escaping (Result<BalanceEntity, Error>) -> Void) {
        return api.getBalance(completion: completion)
    }
}
