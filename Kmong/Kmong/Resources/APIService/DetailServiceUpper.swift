//
//  DetailServiceUpper.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/12/14.
//

import Foundation
import Alamofire

struct DetailServiceUpper {
    static let shared = DetailServiceUpper()
    
    func serviceUpper(completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let serviceUpperURL = APIConstants.serviceUpperURL
        
        let serviceUpperdataRequest = AF.request(serviceUpperURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
        
        serviceUpperdataRequest.responseData { (response) in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                
                completion(judgeDetailServiceUpperData(status: statusCode, data: data))
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeDetailServiceUpperData(status: Int, data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(GenericResponse<ServiceUpperData>.self, from: data) else {
        return .pathErr
        }
        
        switch status {
        case 200:
            return .success(decodedData.data)
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
