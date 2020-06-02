//
//  Onboarding.swift
//  AnimacaoSharing
//
//  Created by Victor Falcetta do Nascimento on 28/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import Foundation

class Onboarding {
    static let shared = Onboarding()
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}
