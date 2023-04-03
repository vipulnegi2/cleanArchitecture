//
//  CreateAccountViewModel.swift
//  AccountsApp_SwiftUI
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation
import Domain
import Data

class CreateAccountViewModel: ObservableObject {
    private var createAccountUseCase: CreateAccountUseCase
    @Published public var messsage: String?
    
    init(accountUseCase:
         CreateAccountUseCase =
         DefaultCreateAccountUseCase(createAccountRepo: DefaultCreateAccountRepository(createAccountFactory: CreateAccountDataStoreFactory(createAccountApi: DefaultCreateAccountApi())))) {
        self.createAccountUseCase = accountUseCase
    }
    
    func createAccount(mobile: Int, success: @escaping (Bool) -> Void) {
     
        let req = ["user": mobile]
        
        self.createAccountUseCase.createAccount(parameters: req) { [weak self] (result) in
            switch result {

            case .success(let resp):
                UserDefaults.standard.set(mobile, forKey: "AuthHeader")
                self?.messsage  = resp.message
                success(true)
                
            case .failure(let error):
                success(false)
                
                if let err = error as? CustomError {
                    print(err.rawValue);
                } else {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
