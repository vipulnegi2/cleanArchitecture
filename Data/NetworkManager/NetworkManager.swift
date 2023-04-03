//
//  NetworkManager.swift
//  Data
//
//  Created by Neha Penkalkar on 30/07/22.
//

import Foundation
import Alamofire
import Domain

protocol NetworkProtocol: AnyObject {
    func performApiCall<T:Decodable>(target: ServiceAPI,
                                     responseModel: T.Type,
                                     completion: @escaping(Result<T, Error>) -> Void)
}


final class NetworkManager: NetworkProtocol {
    
    static let shared = NetworkManager()
    let manager: Alamofire.Session = {
        return Alamofire.Session.default
    }()
    
    private init() {}
    
    func performApiCall<T:Decodable>(target: ServiceAPI,
                                     responseModel: T.Type,
                                     completion: @escaping(Result<T, Error>) -> Void) {
        
        guard Connectivity.isConnectedToInternet else {
            completion(.failure(CustomError.noInternetError))
            return
        }
        
        printRequest(target: target)
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let data = buildParams(task: target.task)
        
        
        manager.request((target.baseURL + target.endPoint), method: method, parameters: data.parameters ,encoding: data.encoding, headers: headers).responseData { response in
            
            self.handleApiSuccessFailure(target: target, model: responseModel, response: response) { data in
                completion(data)
            }
        }
        
    }
    
    private func handleApiSuccessFailure<T: Decodable>(target: ServiceAPI,
                                                       model: T.Type,
                                                       response : AFDataResponse<Data>, completion: @escaping(Result<T, Error>) -> Void) {
        
        guard let statusCode = response.response?.statusCode else {
            completion(.failure(CustomError.noStatusError))
            return
        }
        
        switch response.result {
            
        case .success(let data):
            
            switch statusCode {
                
            case 401:
                
                completion(.failure(CustomError.unauthorizedUser))
                
            default:
                do {
                    if data.count > 0 {
                        guard let decodedResponse = try? JSONDecoder().decode(model, from: data) else {
                            return completion(.failure(CustomError.decodeError))
                        }
                        completion(.success(decodedResponse))
                        
                        print(try JSONSerialization.jsonObject(with: data, options: .mutableContainers))
                    }
                } catch {
                    completion(.failure(error))
                    
                }
            }
            
        case .failure(let error):
            completion(.failure(error))
            
        }
    }
    
    private func buildParams(task: Task) -> NewParameters {
        switch task {
            
        case .requestPlain:
            return NewParameters(parameters: [:], imageData: nil, fileName: nil, keyName: nil, encoding: URLEncoding.default)
            
        case .requestParameters(parameters: let params, encoding: let encoding):
            return NewParameters(parameters: params, imageData: nil, fileName: nil, keyName: nil, encoding: encoding)
            
        }
    }
    
    private func printRequest(target: ServiceAPI) {
        print("\n\n🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳")
        print("HTTP Method: \(target.method.rawValue)")
        if let headers = target.headers {
            print("Headers: \(headers)")
        }
        
        print("RequestedURL: \(target.baseURL)\(target.endPoint)")
        
        print("Parameters: \(buildParams(task: target.task).parameters)")
        print("🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳\n\n")
    }
}

class Connectivity {
    class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}


fileprivate struct NewParameters {
    var parameters: [String: Any]
    var imageData: [Data?]?
    var fileName: String?
    var keyName: String?
    var encoding: ParameterEncoding
}

