//
//  ViewController.swift
//  BTC Conversion
//
//  Created by Inam ur Rehman on 07/01/2019.
//  Copyright © 2019 Lango. All rights reserved.
//

import UIKit

class IntroductionVC: UIViewController {
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    
    // MARK: - IBActions
    @IBAction func proceedTapped(_ sender: Any) {
        proceedAfterValidation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    // MARK: - Private Functions
    private func configureViews(){
        // Could've used some library like TPKeyboardAvoiding etc. to dismiss the keyboard on screen tap
        // But just wanted to demonstrates knowledge about selectors responders etc.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
    }
    
    private func proceedAfterValidation(){
        let shouldProceed = isNameValidated()
        if shouldProceed.0{
            dataManager.saveUserName(userName: shouldProceed.1)
            performSegue(withIdentifier: currencySelectionSegue, sender: self)
        }else{
           _ = showAlert("Missing Name", message: "Please enter your name to proceed", buttonsDictionary: [ "OK": {(alertAction) in
            // Can perform any tasks here upon OK if needed
            }], baseController: self, preferredStyle: .alert)
        }
    }
    
    private func isNameValidated()->(Bool,String){
        guard let nameText = nameTextField.text else {return (false,"")}
        if nameText.count < 1 {return (false,"")}
        return (true,nameText)
    }
    
    
    // MARK: - Selectors
    @objc func dismissKeyboard() {
        if self.nameTextField.isFirstResponder{
            self.nameTextField.resignFirstResponder()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == currencySelectionSegue {
            // Pass any values to the destination controller if any
        }
    }
}

// MARK: - UITextFieldDelegates
extension IntroductionVC:UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let currentText = textField.text else {
            return true
        }
        
        if currentText.count <= 20 {return true}
        else if string == ""{return true}
        
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
