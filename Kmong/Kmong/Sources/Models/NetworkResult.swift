//
//  HomeNetworkResult.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/12/10.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
