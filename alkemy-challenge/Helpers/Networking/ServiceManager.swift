//
//  ServiceManager.swift
//  alkemy-challenge
//
//  Created by Angelica Ferreira on 11/10/22.
//

import Foundation
import Alamofire

class ServiceManager: BaseService {
    func sendRequest<T>(
        endpoint: Endpoint,
        queryParams: [String : String]?,
        of: T.Type,
        completion: @escaping (Result<T, CustomError>) -> Void
    ) where T : Decodable, T : Encodable {
        
        guard let isConnectedToInternet = NetworkReachabilityManager()?.isReachable,
              isConnectedToInternet
        else {
            return completion(.failure(.noInternetConnection))
        }
        
        let finalPath = "\(NetworkConstants.baseUrl)\(endpoint.path)"
        guard let url = URL(string: finalPath) else {
            completion(.failure(.badUrl))
            return
        }
        AF.request(url, method: .get, parameters: queryParams)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        completion(.failure(.responseError))
                        return
                    }
                    do {
                        let response = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(response))
                    } catch {
                        completion(.failure(.responseError))
                    }
                case .failure:
                    completion(.failure(.responseError))
                }
            }
    }
}
