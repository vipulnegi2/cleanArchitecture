//
//  CreateAccountDataStoreFactory.swift
//  Data
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation

public class CreateAccountDataStoreFactory {
    
    private let api: CreateAccountApi
    
    public init(createAccountApi: CreateAccountApi) {
        self.api = createAccountApi
    }
    
    func createCloudDataStore() -> CreateAccountDataStore {
        return CloudCreateAccountDataStore(createAccountApi: api)
    }
}
