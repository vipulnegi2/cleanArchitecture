//
//  CreateAccountRepository.swift
//  Data
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation
import Domain

public final class DefaultCreateAccountRepository: CreateAccountRepository {
    
    private let factory: CreateAccountDataStoreFactory
    
    public init(createAccountFactory: CreateAccountDataStoreFactory) {
        self.factory = createAccountFactory
    }
    
    public func createAccount(parameters: [String : Any], completion: @escaping (Result<CommonResponse, Error>) -> Void) {
        let dataStore: CreateAccountDataStore = factory.createCloudDataStore()
        return dataStore.createAccount(parameters: parameters, completion: completion)
    }
}
