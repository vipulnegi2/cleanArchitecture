//
//  CreateDebitAmountApi.swift
//  Data
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation
import Domain

public protocol CreateDebitAmountApi {
    func debitAmount(parameters: Parameters, completion: @escaping(Result<CommonResponse, Error>) -> Void)
}

public final class DefaultCreateDebitAmountApi : CreateDebitAmountApi {
    public init() {}
    
    public func debitAmount(parameters: Parameters, completion: @escaping (Result<CommonResponse, Error>) -> Void) {
        let handler: NetworkProtocol = NetworkManager.shared
        
        handler.performApiCall(target: .debitAmount(param: parameters), responseModel: CommonResponse.self) { result in
            completion(result)
        }
    }
}
