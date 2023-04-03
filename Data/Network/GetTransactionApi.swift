//
//  GetTransactionApi.swift
//  Data
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation
import Domain

public protocol GetTransactionApi {
    func getTransactions(completion: @escaping(Result<TransactionsEntity, Error>) -> Void)
}

public final class DefaultGetTransactionApi : GetTransactionApi {
    public init() {}
    
    public func getTransactions(completion: @escaping (Result<TransactionsEntity, Error>) -> Void) {
        let handler: NetworkProtocol = NetworkManager.shared
        
        handler.performApiCall(target: .getTransactions, responseModel: TransactionsEntity.self) { result in
            completion(result)
        }
    }
}
