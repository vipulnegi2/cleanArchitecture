//
//  TransactionUseCase.swift
//  Domain
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation

//MARK: - GetBalanceUseCase
public protocol GetBalanceUseCase { // AccountDetailUseCase or TransactionUseCase
        func getBalance(completion: @escaping (Result<BalanceEntity, Error>) -> Void)
}

public final class DefaultGetBalanceUseCase: GetBalanceUseCase {
    private let getBalanceRepo: GetBalanceRepository
    
    public init(getBalanceRepo: GetBalanceRepository) {
        self.getBalanceRepo = getBalanceRepo
    }
    
    public func getBalance(completion: @escaping (Result<BalanceEntity, Error>) -> Void) {
        self.getBalanceRepo.getBalance(completion: completion)
    }
}


//MARK: - GetTransactionUseCase
public protocol GetTransactionUseCase {
        func getTransactions(completion: @escaping (Result<TransactionsEntity, Error>) -> Void)
}


public final class DefaultGetTransactionUseCase: GetTransactionUseCase {
    
    private let getTransactionRepo: GetTransactionRepository
    
    public init(getTransactionRepo: GetTransactionRepository) {
        self.getTransactionRepo = getTransactionRepo
    }
    
    public func getTransactions(completion: @escaping (Result<TransactionsEntity, Error>) -> Void) {
        self.getTransactionRepo.getTransactions(completion: completion)
    }
}


//MARK: - DebitTransactionUseCase
public protocol DebitTransactionUseCase {
    func debitAmount(parameters: [String: Any], completion: @escaping (Result<CommonResponse, Error>) -> Void)
}

public final class DefaultDebitTransactionUseCase: DebitTransactionUseCase {
   
    private let debitTransactionRepo: DebitAmountRepository
    
    public init(debitTransactionRepo: DebitAmountRepository) {
        self.debitTransactionRepo = debitTransactionRepo
    }
    
    public func debitAmount(parameters: [String : Any], completion: @escaping (Result<CommonResponse, Error>) -> Void) {
        self.debitTransactionRepo.debitAmount(parameters: parameters, completion: completion)
    }
}


//MARK: - CreditTransactionUseCase
public protocol CreditTransactionUseCase {
    func creditAmount(parameters: [String: Any], completion: @escaping (Result<CommonResponse, Error>) -> Void)
}

public final class DefaultCreditTransactionUseCase: CreditTransactionUseCase {
   
    private let creditTransactionRepo: CreditAmountRepository
    
    public init(creditTransactionRepo: CreditAmountRepository) {
        self.creditTransactionRepo = creditTransactionRepo
    }
    
    public func creditAmount(parameters: [String : Any], completion: @escaping (Result<CommonResponse, Error>) -> Void) {
        self.creditTransactionRepo.creditAmount(parameters: parameters, completion: completion)
    }
}









