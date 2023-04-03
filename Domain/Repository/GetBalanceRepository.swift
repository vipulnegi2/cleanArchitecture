//
//  GetBalanceRepository.swift
//  Domain
//
//  Created by Neha Penkalkar on 31/07/22.
//

import Foundation

public protocol GetBalanceRepository {
    func getBalance(completion: @escaping(Result<BalanceEntity, Error>) -> Void)
}
