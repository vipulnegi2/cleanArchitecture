//
//  GetBalanceViewModel.swift
//  AccountsApp_SwiftUI
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation
import Domain
import Data

class GetBalanceViewModel: ObservableObject {
    
    @Published public var balance: String?
    
    private var getBalanceUseCase: GetBalanceUseCase
    
    init(getBalanceUseCase: GetBalanceUseCase =
         DefaultGetBalanceUseCase(getBalanceRepo: DefaultGetBalanceRepository(getBalanceDataStoreFactory: GetBalanceDataStoreFactory(getBalance: DefaultGetBalanceApi())))) {
        self.getBalanceUseCase = getBalanceUseCase
    }
    
    public func onAppear() {
        self.getBalance()
    }
    
    private func getBalance() {
        getBalanceUseCase.getBalance { [weak self] (result) in
            switch result {
                
            case .success(let resp):
                self?.balance = "\(resp.balance ?? 0)"
                
            case .failure(let error):
                if let err = error as? CustomError {
                    print(err.rawValue);
                } else {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
