//
//  SimilarService.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/12/16.
//

import Foundation
import Alamofire

struct SimilarService {
    static let shared = SimilarService()
    
    func similarService(completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let similarServiceURL = APIConstants.similarServiceURL
        
        let similarDataRequest = AF.request(similarServiceURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
        
        similarDataRequest.responseData { (response) in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                
                completion(judgeSimilarService(status: statusCode, data: data))
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeSimilarService(status: Int, data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(GenericResponse<[SimilarServiceData]>.self, from: data) else {
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
