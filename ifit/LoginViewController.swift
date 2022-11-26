//
//  LoginViewController.swift
//  iFit
//
//  Created by Alvi Ahmmed Nabil on 10/28/21.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var about: UIButton!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func loginTapped(_ sender: Any) {
        validateFields()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signUp")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
        
    }
    
    func validateFields(){
        if email.text?.isEmpty == true {
            print("No email text")
            return
        }
        if password.text?.isEmpty == true {
            print("No password")
            return
        }
        
        login()
        
    }
    
   
    
    func login(){
        let email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print("Kisu ekta korlam")
                
            }
            
            else{
               
                print(Auth.auth().currentUser?.uid)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "mainHome")
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }
        
//        Auth.auth().signIn(withEmail: email.text!, password: password.text!) {
//            [weak self] authResult, err in
//            guard let strongSelf = self else {return}
//            if let err = err {
//                print(err.localizedDescription)
//            }
//            strongSelf.checkUserInfo()
//        }
    }
//
//    func checkUserInfo() {
//        if Auth.auth().currentUser != nil {
//
//
//        }
//    }
}
