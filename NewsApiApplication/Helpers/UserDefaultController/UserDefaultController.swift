//
//  UserDefaultController.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/9/20.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation
import RxSwift

class UserDefaultController {
    static let shared = UserDefaultController()
    private var currentUserPhone: String? {
        get {
            return UserDefaults.standard[.userPhoneNumber]
        }
        set {
            UserDefaults.standard[.userPhoneNumber] = newValue
        }
    }
    
    private var currentPassword: String? {
        get {
            return UserDefaults.standard[.userPassword]
        }
        set {
            UserDefaults.standard[.userPassword] = newValue
        }
    }
    
    var currentUser: User? {
        get {
            guard
                let currentUserPhone = currentUserPhone,
                let currentPassword = currentPassword
                else { return nil }
            return User(phone: currentUserPhone, password: currentPassword)
        }
        set {
            UserDefaults.standard[.userPhoneNumber] = newValue?.phone
            UserDefaults.standard[.userPassword] = newValue?.password
        }
    }
    private init() {
        
    }
    
    func register(with phone: String, password: String) -> Observable<Result<User, InputError>> {
        return Observable.create { (observer) -> Disposable in
            
            if let inputError = UserInput.checkValidateInput(input: (phone, password)) {
                observer.onNext(.failure(inputError))
            }
            
            self.currentUser = User(phone: phone, password: password)
            observer.onNext(.success(self.currentUser!))
            
            return Disposables.create()
        }
    }
}
