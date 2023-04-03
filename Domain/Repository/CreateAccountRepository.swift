//
//  CreateAccountRepository.swift
//  Domain
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation

public protocol CreateAccountRepository {
    func createAccount(parameters: [String:Any], completion: @escaping(Result<CommonResponse, Error>) -> Void)
}
