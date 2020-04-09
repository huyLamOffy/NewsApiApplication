//
//  UserProfileTests.swift
//  NewsApiApplicationTests
//
//  Created by OkieLa Dev on 4/9/20.
//  Copyright © 2020 none. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa

class UserProfileTests: XCTestCase {
    var disposeBag = DisposeBag()

    override func setUp() {
        super.setUp()
    }
    
    //MARK: - TESTS
    
    func testUnableRegisterButtonWhenGotUser() {
        let vm = UserProfileViewModel()
        vm.dataBinding()
        vm.user.accept(User(phone: "090-294-9969", password: "hahahaha"))
        
        vm.phone.accept("090-294-9969")
        vm.password.accept("hahahaha")
        let expectation = XCTestExpectation(description: "should call completion handler in 10s")
        vm.enableRegister
            .drive(onNext: { enable in
                XCTAssertFalse(enable)
                expectation.fulfill()
            })
            .disposed(by: disposeBag)
        
    }
    
    func testUnableRegisterButton() {
        let vm = UserProfileViewModel()
        vm.dataBinding()
        
        UserDefaultController.shared.currentUser = nil
        vm.phone.accept("33")
        vm.password.accept("djsmc")
        let expectation = XCTestExpectation(description: "should call completion handler in 10s")

        vm.enableRegister
            .drive(onNext: { enable in
                
                XCTAssertFalse(enable)
                expectation.fulfill()
            })
            .disposed(by: disposeBag)
    }
    
    func testEnableRegisterButton() {
        let vm = UserProfileViewModel()
        vm.dataBinding()
        UserDefaultController.shared.currentUser = nil
        vm.phone.accept("090-294-9969")
        vm.password.accept("djsmcww")
        let expectation = XCTestExpectation(description: "should call completion handler in 10s")
        
        vm.enableRegister
            .drive(onNext: { enable in
                XCTAssertTrue(enable)
                expectation.fulfill()

            })
            .disposed(by: disposeBag)
    }

    func testRegisteredUser() {
        let vm = UserProfileViewModel()
        vm.dataBinding()
        
        vm.phone.accept("0902949969")
        vm.password.accept("djsmcww")
        vm.registerHandler.accept(())
        let expectation = XCTestExpectation(description: "should call completion handler in 10s")
        vm.user
            .asDriver(onErrorJustReturn: User(phone: "", password: ""))
            .drive(onNext: { user in
                XCTAssertEqual(user, UserDefaultController.shared.currentUser)
                expectation.fulfill()
            })
            .disposed(by: disposeBag)
    }
}
