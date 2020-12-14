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
    
    func ServiceUpper(title: String, id: String, star: Int, review: Int, heart: Int, price: String, layer: String, serviceImage: [String], completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let serviceUpperURL = APIConstants.serviceUpperURL
        let serviceUpperHeader: HTTPHeaders = ["Content-Type":"application/json"]
        let serviceUpperBody: Parameters = ["title": title, "id": id, "star": star, "review": review, "heart": heart, "price": price, "layer": layer, "serviceImage": serviceImage]
        
        let serviceUpperdataRequest = AF.request(serviceUpperURL, method: .get, parameters: serviceUpperBody, encoding: JSONEncoding.default, headers: serviceUpperHeader)
        
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
