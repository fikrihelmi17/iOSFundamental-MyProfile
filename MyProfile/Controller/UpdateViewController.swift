//
//  UpdateViewController.swift
//  MyProfile
//
//  Created by Fikri on 17/07/20.
//  Copyright © 2020 Fikri Helmi. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var professionTextField: UITextField!
    @IBOutlet weak var saveButton: RoundButton!
    @IBOutlet weak var cancelButton: RoundButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.pinkColor()
        cancelButton.whiteColor()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -250 // Move view 150 points upward
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0 // Move view to original position
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ProfileModel.syncronize()
        nameTextField.text = ProfileModel.name
        emailTextField.text = ProfileModel.email
        professionTextField.text = ProfileModel.profession
    }

    @IBAction func saveAccount(_ sender: Any) {
        if let name = nameTextField.text, let email = emailTextField.text, let profession = professionTextField.text {
            if name.isEmpty {
                textEmpty(field: "Name")
            } else if email.isEmpty {
                textEmpty(field: "Email")
            } else if profession.isEmpty {
                textEmpty(field: "Profession")
            } else {
                saveProfile(name, email, profession)
                
                self.dismiss(animated: true)
            }
        }
    }
    
    @IBAction func cancelUpdate(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func saveProfile(_ name : String, _ email: String, _ profession: String) {
        ProfileModel.stateLogin = true
        ProfileModel.name = name
        ProfileModel.email = email
        ProfileModel.profession = profession
    }
    
    func textEmpty(field: String) {
        let alert = UIAlertController(title: "Alert", message: "\(field) is empty", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
