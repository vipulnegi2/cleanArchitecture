//
//  GetTransactionRepository.swift
//  Domain
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation

public protocol GetTransactionRepository {
    func getTransactions(completion: @escaping(Result<TransactionsEntity, Error>) -> Void)
}
