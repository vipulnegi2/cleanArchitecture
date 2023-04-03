//
//  AddTransactionViewModel.swift
//  AccountsApp_SwiftUI
//
//  Created by Neha Penkalkar on 01/08/22.
//

import Foundation
import Domain
import Data

class AddTransactionViewModel: ObservableObject {
    
    @Published public var messsage: String?
    
    private var debitTransactionUseCase: DebitTransactionUseCase
    private var creditTransactionUseCase: CreditTransactionUseCase
    
    init(debitTransactionUseCase:
         DebitTransactionUseCase =
         DefaultDebitTransactionUseCase(debitTransactionRepo: DefaultDebitAmountRepository(debitAmountDataStoreFactory: DebitAmountDataStoreFactory(debitAmountApi: DefaultCreateDebitAmountApi()))),
         
         creditTransactionUseCase: CreditTransactionUseCase =
         DefaultCreditTransactionUseCase(creditTransactionRepo: DefaultCreditAmountRepository(creditAmountDataStoreFactory: CreditAmountDataStoreFactory(creditAmountApi: DefaultCreateCreditAmountApi())))) {
        self.debitTransactionUseCase = debitTransactionUseCase
        self.creditTransactionUseCase = creditTransactionUseCase
    }
    
    func addTransaction(forRequest req: AccountsModel, success: @escaping (Bool) -> Void) {
        
        if self.isRequestValid(forRequest: req).0 {
           let request = [
               "amount": req.amount as Any,
               "title": req.title as Any
           ] as [String : Any]
           
           switch req.transactionType {
               
           case "credit":
               self.creditTransactionUseCase.creditAmount(parameters: request) { [weak self] (result) in
                   switch result {

                   case .success(let resp):
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
               
           default:
               self.debitTransactionUseCase.debitAmount(parameters: request) { [weak self] (result) in
                   switch result {

                   case .success(let resp):
                       
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
        } else {
            success(false)
            messsage  = isRequestValid(forRequest: req).1
        }
    }
    
    private func isRequestValid(forRequest req: AccountsModel) -> (Bool, String?) {
        
        guard let title = req.title, title.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) != "" else { return (false, "Please enter valid title") }
        guard let amount = req.amount, amount != 0 else { return (false, "Please enter amount") }
        guard let _ = req.transactionType else { return (false, "Please select transaction type") }
        
        return (true, nil)
    }
}
