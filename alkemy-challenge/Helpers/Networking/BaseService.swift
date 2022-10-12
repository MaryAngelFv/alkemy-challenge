//
//  BaseService.swift
//  alkemy-challenge
//
//  Created by Brayam Mora on 11/10/22.
//

import Foundation

protocol BaseService {
    func sendRequest<T: Codable>(
        endpoint: Endpoint,
        queryParams: [String: String]?,
        of: T.Type,
        completion: @escaping (Result<T, CustomError>) -> Void
    )
}
