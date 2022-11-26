//
//  mainViewController.swift
//  iFit
//
//  Created by Alvi Ahmmed Nabil on 10/29/21.
//

import UIKit
import Firebase

class mainViewController: UIViewController {

    @IBOutlet var planNames: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        planNames.text = "Workout Plans"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func advancedButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "advanced")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    @IBAction func intermediateButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "intermediate")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func beginnerButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "beginner")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        let auth = Auth.auth()
        do {
            try auth.signOut()
//            let defaults = UserDefaults.standard
//            defaults.set(false, forKey: "isUserSignedIn")
//            self.dismiss(animated: true, completion: nil)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "login")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        } catch let signoutError as Error {
//            self.present(Service.(title:"Error",message: signoutError.localizedDescription),animated: true,completion: nil)
//            self.present(lo, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
            print("error hoise")
        }
    }
    
}
