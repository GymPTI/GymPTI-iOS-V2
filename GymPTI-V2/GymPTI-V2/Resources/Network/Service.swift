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
        
        let request = session.request("\(api)\(url)",
                                      method: method,
                                      parameters: params,
                                      encoding: method == .get ? URLEncoding.default : JSONEncoding.default)
        
        let dataTask = request.serializingDecodable(model)
        
        switch await dataTask.result {
            
        case .success(let value):
            
            guard let response = await dataTask.response.response, (200...299).contains(response.statusCode) else {
                throw await APIError.responseError(dataTask.response.response!.statusCode)
            }
            return value
            
        case .failure(let error):
            throw APIError.transportError(error)
        }
    }
}

enum APIError: Error {
    case transportError(Error)
    case responseError(Int)
    case unknownError

    var localizedDescription: String {
        switch self {
        case .transportError(let error):
            return "네트워크 전송 오류: \(error.localizedDescription)"
        case .responseError(let statusCode):
            return "서버 응답 오류: HTTP 상태 코드 \(statusCode)"
        case .unknownError:
            return "알 수 없는 오류가 발생했습니다."
        }
    }
}
