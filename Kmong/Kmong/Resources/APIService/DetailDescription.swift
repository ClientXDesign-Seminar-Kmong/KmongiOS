//
//  DetailDescription.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/12/16.
//

import Foundation
import Alamofire

struct DetailDescription {
    static let shared = DetailDescription()
    
    func detailDescription(completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let detailDescriptionURL = APIConstants.detailDescriptionURL
        
        let descDataRequest = AF.request(detailDescriptionURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
        
        descDataRequest.responseData { (response) in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                
                completion(judgeDetailDescription(status: statusCode, data: data))
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeDetailDescription(status: Int, data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(GenericResponse<DetailDescriptionData>.self, from: data) else {
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
