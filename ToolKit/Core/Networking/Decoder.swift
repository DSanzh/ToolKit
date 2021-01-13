//
//  Decoder.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 10/8/20.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

//import Moya
import Foundation

//class RequestDecoder {
//
//    static let shared = RequestDecoder()
//
//    private init() {}
//
//    func decodeResult<T: Codable>(_ result: Result<Response, MoyaError>, for type: T.Type) -> Result<T, NetworkError> {
//            switch result {
//            case .success(let response):
//                response.data.printAsJSON()
//                print(response.response?.headers)
//                do {
//                    let decodedData = try jsonDecoder.decode(T.self, from: response.data)
//                    return .success(decodedData)
//                } catch {
//                    let error = NetworkError.decodeFailure
//                    return .failure(error)
//                }
//            case .failure(let error):
//                return .failure(.moyaError(error))
//            }
//    }
//
//    private var jsonDecoder: JSONDecoder = {
//        let decoder = JSONDecoder()
//        return decoder
//    }()
//}
