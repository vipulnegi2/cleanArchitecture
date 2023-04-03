//
//  ServiceApi.swift
//  Data
//
//  Created by Neha Penkalkar on 30/07/22.
//

import Foundation
import Alamofire
import SwiftUI

public typealias Parameters = [String:Any]


var appURL: String {
    switch environment {
    case .test:
        return "http://3.108.193.154:7000/api/"
    case .staging:
        return ""
    case .production:
        return ""
    }
}

enum ProjectEnvironment {
    case test, staging, production
}

var environment: ProjectEnvironment = .test

public enum ServiceAPI {
    case createAccount(param: Parameters)
    case creditAmount(param: Parameters)
    case debitAmount(param: Parameters)
    case getBalance
    case getTransactions
    
}

extension ServiceAPI {
    var baseURL: String { 
        return appURL
    }
    
    var endPoint: String {
        switch self {
        case .createAccount:
            return "transactions"
            
        case .creditAmount:
            return "credit"
            
        case .debitAmount:
            return "debit"
            
        case .getBalance:
            return "balance"
            
        case .getTransactions:
            return "transactions"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .createAccount,
                .creditAmount,
                .debitAmount:
            return .post
        case .getBalance,
                .getTransactions:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .createAccount(param: let param),
                .creditAmount(param: let param),
                .debitAmount(param: let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
             
        case .getBalance,
                .getTransactions:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        var headersDict:[String:String]? = [:]
        
        switch self {
        case .createAccount:
            headersDict = emptyAuth()
            return headersDict
            
        case .creditAmount,
                .debitAmount,
                .getBalance,
                .getTransactions:
            headersDict = authHeader()
            return headersDict
        }
    }
}

extension ServiceAPI {
    func emptyAuth() -> [String  : String] {
        let headerval = ["Accept":"application/json",
                         "Content-Type": "application/json"]
        return headerval
    }
    
    func authHeader() -> [String : String] {
        @AppStorage("AuthHeader") var header: Int?
        
        var headerVal: [String : String] = emptyAuth()
        headerVal.updateValue("\(header ?? 0)", forKey: "Authorization")
        return headerVal
    }
}

enum Task {
    ///A request with no additional data
    case requestPlain
    
    ///A request body set with encoded paramters
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}
