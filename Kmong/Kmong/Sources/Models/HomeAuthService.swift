//
//  HomeAuthService.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/12/10.
//

import Foundation
import Alamofire

struct HomeAuthService {
    static let shared = HomeAuthService()
    
    func homeHeader(id: Int,
                    image: String,
                    completion: @escaping (NetworkResult<Any>) -> (Void)) {
        let url = APIConstants.homeBannerURL
        let header : HTTPHeaders = [
            "Content-Type":"application/json"
        ]
        
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { (response) in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                completion(judgeSignInData(status: statusCode, data: data))
                
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeSignInData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<HomeHeaderImage>.self, from: data) else {
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
