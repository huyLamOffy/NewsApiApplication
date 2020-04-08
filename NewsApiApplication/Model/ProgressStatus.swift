//
//  ProgressStatus.swift
//  Logistic
//
//  Created by OkieLa Dev on 3/10/20.
//  Copyright © 2020 okiela. All rights reserved.
//

import Foundation

enum ProgressStatus {
    case failed(message: String?)
    case success(message: String?)
    case loading(message: String?)
    case complete
}
