//
//  DebitAmountDataStore.swift
//  Data
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation
import Domain

protocol DebitAmountDataStore {
    func debitAmount(parameters: [String: Any], completion: @escaping (Result<CommonResponse, Error>) -> Void)
}

class CloudDebitAmountDataStore: DebitAmountDataStore {

    private let api: CreateDebitAmountApi
    
    init(debitAmountApi: CreateDebitAmountApi) {
        self.api = debitAmountApi
    }
    
    func debitAmount(parameters: [String : Any], completion: @escaping (Result<CommonResponse, Error>) -> Void) {
        return api.debitAmount(parameters: parameters, completion: completion)
    }
}
