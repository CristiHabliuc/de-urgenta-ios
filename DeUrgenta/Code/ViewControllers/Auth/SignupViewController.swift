//
//  SignupViewController.swift
//  DeUrgenta
//
//  Created by Cristi Habliuc on 03.04.2021.
//

import UIKit
import Promises

@available(*, deprecated, message: "Not using in favor of SwiftUI. Kept for reference until full migration")
class SignupViewController: DUViewController {
    let model = SignupViewModel()
    
    @IBOutlet weak var registerButton: DUActionButton!
    @IBOutlet weak var emailField: DUFormTextFieldContainer!
    @IBOutlet weak var passwordField: DUFormTextFieldContainer!
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .default }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFields()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setStyle(.translucentDarkContent)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func handleRegisterButtonTap(_ sender: Any) {
        updateModel()
        model.validate()
            .then { self.submit() }
            .then { self.handleSuccess() }
            .catch { error in
                self.isFullscreenSpinnerVisible = false
                self.showAlert(
                    withTitle: "Eroare",
                    message: "Nu am putut trimite cererea: \(error.localizedDescription)")
            }
    }
    
    private func configureFields() {
        let fields: [DUFormTextFieldContainer] = [ emailField, passwordField ]
        fields.forEach { field in
            let fieldIndex = fields.firstIndex(of: field)!
            if fieldIndex == fields.endIndex - 1 {
                field.onNext = { self.handleRegisterButtonTap(self.registerButton!) }
                field.keyboardReturnType = .go
            } else {
                let nextFieldIndex = fields.index(after: fieldIndex)
                let nextField = fields[nextFieldIndex]
                field.onNext = { nextField.textField.becomeFirstResponder() }
                field.keyboardReturnType = .next
            }
        }
    }
    
    private func updateModel() {
        model.email = emailField.textField.text ?? ""
        model.password = passwordField.textField.text ?? ""
    }
    
    private func handleSuccess() {
        isFullscreenSpinnerVisible = false
        LogInfo("Signed up.")
        OldAppRouter.shared.navigateToDashboard()
    }
    
    private func submit() -> Promise<()> {
        isFullscreenSpinnerVisible = true
        return model.submit()
    }
    
}
