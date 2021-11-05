//
//  RegisterViewModel.swift
//  DeUrgenta
//
//  Created by Cristi Habliuc on 22.07.2021.
//

import Foundation
import SwiftUI
import Promises

extension RegisterView {
    
    class ViewModel: ObservableObject {
        @Published var firstName: String = ""
        @Published var lastName: String = ""
        @Published var email: String = ""
        @Published var password: String = ""
        
        @Published var isSuccess = false
        
        @Published var errorMessage: String?
        @Published var isError = false

        @Published var isTermsAgreed = false
        
        enum FieldType {
            case email
            case password
            case firstName
            case lastName

            var localizedName: String {
                switch self {
                case .email:
                    return "adresa de email"
                case .password:
                    return "parola"
                case .firstName:
                    return "prenumele"
                case .lastName:
                    return "numele de familie"
                }
            }
        }
        
        enum ModelError: Error, LocalizedError {
            case incorrect(what: FieldType)
            case missing(what: FieldType)
            case serverError(reason: Error)
            
            var errorDescription: String? {
                switch self {
                case .incorrect(let what):
                    return what.localizedName.capitalized + " invalidă"
                case .missing(let what):
                    return "Te rog să introduci " + what.localizedName
                case .serverError(let reason):
                    return "Eroare de la server: " + reason.localizedDescription
                }
            }
        }

        func submit() -> Promise<()> {
            let promise = Promise<()>.pending()
            let request = RegisterRequest(email: email, password: password, firstName: firstName, lastName: lastName)
            DUAPI.shared.register(request)
                .then { _ in
                    // attempt to auth
                    self.authenticateWithStoredCredentials()
                }
                .then { _ in
                    // auth successful
                    promise.fulfill(())
                }
                .catch { promise.reject(ModelError.serverError(reason: $0)) }
            return promise
        }
        
        func validate() -> Promise<()> {
            let promise = Promise<()>.pending()
            guard !email.isEmpty else {
                promise.reject(ModelError.missing(what: .email))
                return promise
            }
            guard !password.isEmpty else {
                promise.reject(ModelError.missing(what: .password))
                return promise
            }
            guard email.isValidEmail else {
                promise.reject(ModelError.incorrect(what: .email))
                return promise
            }
            guard !firstName.isEmpty else {
                promise.reject(ModelError.missing(what: .firstName))
                return promise
            }
            guard !lastName.isEmpty else {
                promise.reject(ModelError.missing(what: .lastName))
                return promise
            }
            promise.fulfill(())
            return promise
        }
        
        private func storeCredentials() {
            AccountManager.shared.email = email
            AccountManager.shared.password = password
        }
        
        private func authenticateWithStoredCredentials() -> Promise<()> {
            storeCredentials()
            return AccountManager.shared.authenticate().then {
                AccountManager.shared.createStoredUserIfNecessary()
            }
        }
    }

}
