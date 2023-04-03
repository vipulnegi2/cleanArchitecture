//
//  GetBalanceApi.swift
//  Data
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation
import Domain

public protocol GetBalanceApi {
    func getBalance(completion: @escaping(Result<BalanceEntity, Error>) -> Void)
}

public final class DefaultGetBalanceApi : GetBalanceApi {
    public init() {}
    
    public func getBalance(completion: @escaping (Result<BalanceEntity, Error>) -> Void) {
        let handler: NetworkProtocol = NetworkManager.shared
        
        handler.performApiCall(target: .getBalance, responseModel: BalanceEntity.self) { result in
            completion(result)
        }
    }
}
