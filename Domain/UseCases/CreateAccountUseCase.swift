//
//  CreateAccountUseCase.swift
//  Domain
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation

public protocol CreateAccountUseCase {
    func createAccount(parameters: [String: Any], completion: @escaping (Result<CommonResponse, Error>) -> Void)
}

public final class DefaultCreateAccountUseCase: CreateAccountUseCase {
   
    private let createAccountRepo: CreateAccountRepository
    
    public init(createAccountRepo: CreateAccountRepository) {
        self.createAccountRepo = createAccountRepo
    }
    
    public func createAccount(parameters: [String : Any], completion: @escaping (Result<CommonResponse, Error>) -> Void) {
        self.createAccountRepo.createAccount(parameters: parameters, completion: completion)
    }
}


