//
//  DetailExpertService.swift
//  Kmong
//
//  Created by 이예슬 on 2020/12/18.
//

import Foundation
import Alamofire

struct DetailExpertService{
    static let shared = DetailExpertService()
    
    let url = APIConstants.serviceExpertURL
    
    func getDetailExpert(completion: @escaping (NetworkResult<Any>) -> (Void)){
        let dataRequest = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
        
        dataRequest.responseData{
            response in
            switch response.result{
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.value else{ return }
                completion(judgeDetailExpertData(status: statusCode, data: data))
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    func judgeDetailExpertData(status: Int, data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(GenericResponse<DetailExpertData>.self, from: data) else{
            return .pathErr
        }
        switch status{
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
