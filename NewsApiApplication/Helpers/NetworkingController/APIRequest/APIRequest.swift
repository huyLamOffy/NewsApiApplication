//
//  APIRequest.swift
//  ineocoin
//
//  Created by glory luu on 1/18/18.
//  Copyright © 2018 Engie Ineo. All rights reserved.
//

import Alamofire
import CodableAlamofire
import RxSwift

class APIRequest {
    private let queue = DispatchQueue(label: Bundle.main.bundleIdentifier! + ".network-queue",
                                      qos: .userInitiated,
                                      attributes:.concurrent)
    private var sessionManager: Alamofire.Session
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.headers["Content-Type"] = "application/json; charset=utf-8"
        configuration.headers["x-api-key"] = Constant.apiKey

        sessionManager = Alamofire.Session(configuration: configuration)
    }
    
    deinit {
        sessionManager.session.invalidateAndCancel()
    }
    
    func requestObject<T: Decodable>(route: URLRequestConvertible, completion: @escaping (Result<T, APIError>) -> Void) {
        guard ReachabilityManager.shared.isNetworkAvailable else {
            completion(.failure(.noInternet))
            return
        }
        
        sessionManager
            .request(route)
            .responseDecodableObject(queue: queue, decoder: decoder) { (response: AFDataResponse<T>) in
                switch response.result {
                case .success(let object):
                    completion(.success(object))
                case .failure(let error):
                    completion(.failure(.custom(message: error.localizedDescription)))
                }
        }
    }

}

//MARK: - collab RxSwift

extension APIRequest {
    func requestObject<T: Decodable>(route: URLRequestConvertible) -> Observable<Result<T, APIError>> {
        return Observable.create { (observable) in
            if ReachabilityManager.shared.isNetworkAvailable {
                
                self.sessionManager
                    .request(route)
                    .responseDecodableObject(completionHandler: { (response: AFDataResponse<T>) in
                        switch response.result {
                        case .success(let object):
                            observable.onNext(.success(object))
                        case .failure(let error):
                            observable.onNext(.failure(APIError.custom(message: error.localizedDescription)))
                        }
                    })
                
            } else {
                observable.onNext(.failure(APIError.noInternet))
            }
            
            return Disposables.create()
        }
    }
}

fileprivate var decoder: JSONDecoder {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    return decoder
}
