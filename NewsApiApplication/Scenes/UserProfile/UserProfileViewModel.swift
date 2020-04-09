//
//  UserProfileViewModel.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/9/20.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class UserProfileViewModel {
    let disposeBag = DisposeBag()
    var phone = PublishRelay<String?>()
    var password = PublishRelay<String?>()
    var enableRegister = Observable<Bool>.just(false).asDriver(onErrorJustReturn: false)
    var registerHandler = PublishRelay<Void>()
    var user = BehaviorRelay<User?>(value: nil)
    var error = PublishRelay<InputError?>()
    
    func dataBinding() {
        let usernameAndPassword = Observable
            .combineLatest(phone, password, resultSelector: { phone, password -> (phone: String, password: String) in
                return (phone: phone.unwrap, password: password.unwrap)
            })
            .share(replay: 1)
        
        enableRegister = usernameAndPassword
            .map ({ [weak self] input -> Bool in
                if self?.user.value != nil {
                    return false
                }
                
                if UserInput.checkValidateInput(input: input) != nil {
                    return false
                }
                return true
               
            }).asDriver(onErrorJustReturn: false)
        
        let _ = registerHandler
            .withLatestFrom(usernameAndPassword)
            .flatMapLatest({ (input) -> Observable<Result<User, InputError>> in
                return UserDefaultController.shared.register(with: input.phone, password: input.password)
            })
            .subscribe(onNext: { [weak self] result in
                switch result {
                case .success(let response):
                    self?.user.accept(response)
                case .failure(let error):
                    self?.error.accept(error)
                }
                
            })
            .disposed(by: disposeBag)
        
        
    }
}
