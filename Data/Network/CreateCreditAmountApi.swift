//
//  CreateCreditAmountApi.swift
//  Data
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation
import Domain

public protocol CreateCreditAmountApi {
    func creditAmount(parameters: Parameters, completion: @escaping(Result<CommonResponse, Error>) -> Void)
}

public final class DefaultCreateCreditAmountApi : CreateCreditAmountApi {
    public init() {}
    
    public func creditAmount(parameters: Parameters, completion: @escaping (Result<CommonResponse, Error>) -> Void) {
        let handler: NetworkProtocol = NetworkManager.shared
        
        handler.performApiCall(target: .creditAmount(param: parameters), responseModel: CommonResponse.self) { result in
            completion(result)
        }
    }
}
