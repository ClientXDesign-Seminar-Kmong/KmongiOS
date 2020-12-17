//
//  LikeBtn.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/12/17.
//

import Foundation
import Alamofire

struct DetailLikeBtn {
    static let shared = DetailLikeBtn()
    
    func detialLikeBtn(like: Bool, userId: Int, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let detailLikeURL = APIConstants.likeBtnURL
        let body: Parameters = ["like": like, "userId": userId]
        
        let detailLikeDataRequest = AF.request(detailLikeURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil)
        
        detailLikeDataRequest.responseData { (response) in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                
                completion(judgeDetailLikeBtnData(status: statusCode, data: data))
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeDetailLikeBtnData(status: Int, data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(GenericResponse<String>.self, from: data) else {
        return .pathErr
        }
        
        switch status {
        case 200:
            return .success(decodedData.status)
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}

