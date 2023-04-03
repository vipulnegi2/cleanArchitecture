//
//  CloudCreateAccountDataStore.swift
//  Data
//
//  Created by Vipul Negi on 02/08/22.
//

import Foundation
import Domain

class CloudCreateAccountDataStore: CreateAccountDataStore { //within seperate file and nomenclature is correct

    private let api: CreateAccountApi
    
    init(createAccountApi: CreateAccountApi) {
        self.api = createAccountApi
    }
    
    func createAccount(parameters: [String : Any], completion: @escaping (Result<CommonResponse, Error>) -> Void) {
        return api.createAccount(parameters: parameters, completion: completion)
    }
}
