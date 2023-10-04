//
//  Requests.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import Alamofire

final class Service {
    
    private static let session: Session = {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        let interceptor = Interceptor()
        return Session(configuration: configuration,
                       interceptor: interceptor)
    }()
    
    static func request<T: Codable>(_ url: String,
                                    _ method: HTTPMethod,
                                    params: [String: Any]? = nil,
                                    _ model: T.Type = ErrorResponse.self) async throws -> T {
        
        let request = session.request("\(API)\(url)",
                                      method: method,
                                      parameters: params,
                                      encoding: method == .get ? URLEncoding.default : JSONEncoding.default)
        
        let dataTask = request.serializingDecodable(model)
        
        switch await dataTask.result {
            
        case .success(let value):
            
            guard let response = await dataTask.response.response, (200...299).contains(response.statusCode) else {
                throw APIError.responseError
            }
            return value
            
        case .failure:
            throw APIError.transportError
        }
    }
}

enum APIError: Error {
    case transportError
    case responseError
    case dataError
    
    var errorDescription: String {
        return "서버 통신 중 오류가 발생했습니다\n(Error code: \(self))"
    }
}
