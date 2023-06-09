//
//  Requests.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import Alamofire

class Requests {
    
    static func simple(_ url: String,
                       _ method: HTTPMethod,
                       params: [String: Any]? = nil,
                       failure: @escaping (String) -> Void,
                       completion: @escaping () -> Void) {
        AF.request("\(API)\(url)",
                   method: method,
                   parameters: params,
                   encoding: method == .get ? URLEncoding.default : JSONEncoding.default,
                   interceptor: Interceptor()
        )
        .validate()
        .responseData { response in
            if let resdata = response.data {
                print(String(decoding: resdata, as: UTF8.self))
            }
            switch response.result {
                
            case .success:
                completion()
                
            case .failure:
                if let data = response.data {
                    let decoder = JSONDecoder()
                    
                    if let decodedData = try? decoder.decode(ErrorResponse.self, from: data) {
                        
                        DispatchQueue.main.async {
                            failure(decodedData.message)
                        }
                    }
                }
            }
        }
    }
    
    static func request<T: Codable>(_ url: String,
                                    _ method: HTTPMethod,
                                    params: [String: Any]? = nil,
                                    _ model: T.Type,
                                    failure: @escaping (String) -> Void,
                                    completion: @escaping (T) -> Void) {
        AF.request("\(API)\(url)",
                   method: method,
                   parameters: params,
                   encoding: method == .get ? URLEncoding.default : JSONEncoding.default,
                   interceptor: Interceptor()
        ) { $0.timeoutInterval = 5 }
            .validate(statusCode: 200 ..< 204)
            .responseData { response in
                
                if let resdata = response.data {
                    print(String(decoding: resdata, as: UTF8.self))
                }
                
                switch response.result {
                    
                case .success:
                    if let data = response.data {
                        let decoder = JSONDecoder()
                        
                        if let decodedData = try?
                            decoder.decode(Response<T>.self, from: data) {
                            DispatchQueue.main.async {
                                completion(decodedData.data)
                            }
                        }
                    }
                case .failure:
                    
                    if let data = response.data {
                        let decoder = JSONDecoder()
                        
                        if let decodedData = try? decoder.decode(ErrorResponse.self, from: data) {
                            
                            DispatchQueue.main.async {
                                failure(decodedData.message)
                            }
                        }
                    }
                }
            }
    }
    
    static func uploadImage(_ url: String,
                            image: Data,
                            completion: @escaping () -> Void) {
        
        let accessToken = Token.get(.accessToken)!.replacingOccurrences(of: "(", with: "_")
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(accessToken)",
            "Content-Type": "multipart/form-data"
        ]
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(image, withName: "profileImage", fileName: "image.png", mimeType: "image/png")
            
        }, to: "\(API)\(url)", method: .put, headers: headers)
        .validate(statusCode: 200 ..< 204)
        .responseData { response in
            
            if let resdata = response.data {
                print(String(decoding: resdata, as: UTF8.self))
            }
            
            switch response.result {
                
            case .success:
                DispatchQueue.main.async {
                    completion()
                }
            case .failure:
                print("프로필 이미지 변경 실패")
            }
        }
    }
}
