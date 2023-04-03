//
//  FetchTransactionsViewModel.swift
//  AccountsApp_SwiftUI
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation
import Domain
import Data

class FetchTransactionViewModel: ObservableObject {
    
    @Published public var responseObj: [TransactionsData]?
    
    private var fetchTransactionUseCase: GetTransactionUseCase
    
    init(getTransactionsUseCase: GetTransactionUseCase =
         DefaultGetTransactionUseCase(getTransactionRepo: DefaultGetTransactionRepository(getTransactionDataStoreFactory: GetTransactionDataStoreFactory(getTransaction: DefaultGetTransactionApi())))) {
        self.fetchTransactionUseCase = getTransactionsUseCase
    }
    
    public func onAppear() {
        self.getTransactions()
    }
    
    private func getTransactions() {
        fetchTransactionUseCase.getTransactions { [weak self] (result) in
            switch result {
                
            case .success(let resp):
                self?.responseObj = resp.transactions
                
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
