//
//  Constants.swift
//  AccountsApp_SwiftUI
//
//  Created by Neha Penkalkar on 28/07/22.
//

import Foundation

public enum CustomError: String, Error {
    case emptyTransaction = "Please select transaction type"
    case emptyAmount = "Please enter amount"
    
    case genericErrorMessage = "Something went wrong. Please try again later."
    case noStatusError = "No status code something went wrong"
    case noResponseError = "No response"
    case decodeError = "Failed to decode object"
    case noInternetError = "Internet connection is not available"
    case unauthorizedUser = "User credentials not found"
}

