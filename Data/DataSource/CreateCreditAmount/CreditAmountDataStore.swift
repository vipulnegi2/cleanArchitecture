//
//  CreditAmountDataStore.swift
//  Data
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation
import Domain

protocol CreditAmountDataStore {
    func creditAmount(parameters: [String: Any], completion: @escaping (Result<CommonResponse, Error>) -> Void)
}

class CloudCreditAmountDataStore: CreditAmountDataStore {

    private let api: CreateCreditAmountApi
    
    init(creditAmountApi: CreateCreditAmountApi) {
        self.api = creditAmountApi
    }
    
    func creditAmount(parameters: [String : Any], completion: @escaping (Result<CommonResponse, Error>) -> Void) {
        return api.creditAmount(parameters: parameters, completion: completion)
    }
}
