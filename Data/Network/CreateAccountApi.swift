//
//  CreateAccountApi.swift
//  Data
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation
import Domain

public protocol CreateAccountApi {
    func createAccount(parameters: [String:Any], completion: @escaping(Result<CommonResponse, Error>) -> Void)
}

public final class DefaultCreateAccountApi : CreateAccountApi {
    public init() {}
    
    public func createAccount(parameters: [String : Any], completion: @escaping (Result<CommonResponse, Error>) -> Void) {
        let handler: NetworkProtocol = NetworkManager.shared
        
        handler.performApiCall(target: .createAccount(param: parameters), responseModel: CommonResponse.self) { result in
            completion(result)
        }
    }
}
