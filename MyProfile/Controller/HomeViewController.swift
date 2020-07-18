//
//  HomeViewController.swift
//  MyProfile
//
//  Created by Fikri on 17/07/20.
//  Copyright © 2020 Fikri Helmi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var editButton: RoundButton!
    @IBOutlet weak var resetButton: RoundButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        editButton.pinkColor()
        resetButton.pinkColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ProfileModel.syncronize()
        detailLabel.text = "\(ProfileModel.name) as \(ProfileModel.profession)"
        emailLabel.text = ProfileModel.email
    }

    @IBAction func editAccount(_ sender: Any) {
        self.performSegue(withIdentifier: "moveToUpdate", sender: self)
    }
    
    @IBAction func resetAccount(_ sender: Any) {
        if ProfileModel.deleteAll() {
            self.performSegue(withIdentifier: "moveToCreate", sender: self)
        }
    }
}
