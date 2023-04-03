//
//  CreateAccountDataStore.swift
//  Data
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation
import Domain

protocol CreateAccountDataStore {
    func createAccount(parameters: [String: Any], completion: @escaping (Result<CommonResponse, Error>) -> Void)
}


