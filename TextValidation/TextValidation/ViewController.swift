//
//  ViewController.swift
//  TextValidation
//
//  Created by Everett Brothers on 9/19/23.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var requireLabel: UILabel!
    @IBOutlet weak var usernameText: UITextField!
    
    var message = ""
    var acTitle = ""
    var check = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requireLabel.text = ""
        
    }
    func checkPass() -> Bool {
        if let pass = passwordText.text {
            if (pass.contains("!") || pass.contains("@") || pass.contains("#") || pass.contains("$") || pass.contains("%") || pass.contains("&") || pass.contains("?") || pass.contains("~")) {
                if pass.count > 8 {
                    if pass.lowercased() != pass {
                        if (pass.contains("1") || pass.contains("2") || pass.contains("3") || pass.contains("4") || pass.contains("5") || pass.contains("6") || pass.contains("7") || pass.contains("8") || pass.contains("9") || pass.contains("0")) {
                            message.append("\nPassword does not meet requirements")
                            if !pass.isEmpty {
                                return true
                            }
                        }
                    }
                }
            }
        }
        return false
    }
    
    func checkUser() -> Bool {
        if let user = usernameText.text {
            if (user.contains(".") && user.contains("@")) {
                return true
            }
        }
        return false
    }
    
    @IBAction func Login(_ sender: Any) {
        if checkUser() {
            if checkPass() {
                message = "Success"
            } else {
                message = "Password does not meet requirements"
                check = true
            }
        } else {
            message = "Invalid Email"
        }
        
        if check {
            requireLabel.text = "Password needs to be >8 long,\nUse a special character,\nUse a Capital,\nUse a number"
        }
        
        let ac = UIAlertController(title: acTitle, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Done", style: .cancel))
        present(ac, animated: true)
    }
    
}

