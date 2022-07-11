//
//  InputConfirmHelper.swift
//  WiproTest
//
//  Created by RandyKBannister on 7/11/22.
//

import Foundation

enum ErrorMessage: String {
    case upper = "Should have one upper"
    case special = "Should have one special"
    case numbers = "Should have 2 numbers"
    case sixCharacters = "Should have more than 6 characters"
    case right
}

class InputConfirmHelper {
    func checkEmail(email: String) -> Bool {
        if email.contains("@"), email.hasSuffix(".com") {
            return true
        }
        return false
    }
    
    func passwordCheck(pwd: String) -> ErrorMessage {
        let capitalRegEx = ".*[A-Z]+.*"
        let textTest = NSPredicate(format: "SELF MATCHES %@", capitalRegEx)
        let capitalResult = textTest.evaluate(with: pwd)
        if !capitalResult {
            return .upper
        }
        
        let specialReg = ".*[!^%#@()/]+.*"
        let specTest = NSPredicate(format: "SELF MATCHES %@", specialReg)
        let speResult = specTest.evaluate(with: pwd)
        
        if !speResult {
            return .special
        }
        
        let numberReg = ".*[0-9]+.*"
        let numTest = NSPredicate(format: "SELF MATCHES %@", numberReg)
        let numResult = numTest.evaluate(with: pwd)
        
        if !numResult {
            return .numbers
        }

        if pwd.count < 6 {
            return .sixCharacters
        }

        return .right
    }
}
