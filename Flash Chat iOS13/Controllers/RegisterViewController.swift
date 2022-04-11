//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        // This lines create our imputs from the UI, 'cause we need two inputs
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            // This block is to create new users, and give "authResult" and "error". So we have to asign an action to this outputs. In error case show a notification to the user for example. In authResult case our master action usually you will send the user to another UI. The next code do that:
            Auth.auth().createUser(withEmail: email, password: password) {authResult, error in
                if let e = error {
                    print(e.localizedDescription) //This code will show a descrtipion of the Error and "localized" will put in user's language selected in iPhone
                } else {
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
        
    }
}
