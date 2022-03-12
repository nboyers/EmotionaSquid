//
//  AuthManager.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 3/12/22.
//

import Foundation
import FirebaseAuth


class AuthManager {
    static let shared = AuthManager()
    private let auth = Auth.auth()
    private var verificationID: String?
    
    public func startAuth(phoneNumber: String, completion: @escaping (Bool) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { [weak self] verificationID, error in
            guard let verificationID = verificationID, error == nil else {
                completion(false)
                return
            }
            self?.verificationID = verificationID
            completion(true)
        }
    }
    public func verifyCode(smsCode: String, completion: @escaping (Bool) -> Void) {
        guard let verificationID = verificationID  else {
            completion(false)
            return
        }
        
        let crediential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID, verificationCode: smsCode)
        
        auth.signIn(with: crediential) { result, error in
            guard result != nil, error == nil else {
                completion(false)
                return
            }
            completion(true)
        }
        
    }
}
