//
//  beginnerViewController.swift
//  iFit
//
//  Created by Alvi Ahmmed Nabil on 10/29/21.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class AdvancedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var count = 0
    @IBOutlet var AdvancedName: UILabel!
    @IBOutlet var tillButton: UILabel!
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    var list = ["Day 1","Day 2","Day 3","Day 4","Day 5","Day 6","Day 7","Day 8","Day 9","Day 10","Day 11","Day 12","Day 13","Day 14","Day 15","Day 16","Day 17","Day 18","Day 19","Day 20","Day 21","Day 22","Day 23","Day 24","Day 25","Day 25","Day 26","Day 27","Day 28","Day 29","Day 30"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "days")
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        count = indexPath.row
        if (count==0 || count==2 || count==4 || count==6 || count==8 || count==10 || count==12 || count==14 || count==16 || count==18 || count==20 || count==22 || count==24 || count==26 || count==28 || count==30){
            performSegue(withIdentifier: "exercise4", sender: self)
        }
        if (count==1 || count==3 || count==5 || count==7 || count==9 || count==11 || count==13 || count==15 || count==17 || count==19 || count==21 || count==23 || count==25 || count==27 || count==29) {
            performSegue(withIdentifier: "exercise5", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(count == -1200){
            count = 0
        }
        else if(count%2==1){
            var vc = segue.destination as! Advanced2ViewController
            vc.fcount = count
        }
        else{
            var vc = segue.destination as! Advanced1ViewController
            vc.fcount = count
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AdvancedName.text = "Advanced Level"
        // Do any additional setup after loading the view.
        let key  = Auth.auth().currentUser?.uid
        ref = Database.database().reference()
        databaseHandle = ref?.child("users").child(key!).child("Advanced").child("DayTill").observe(.value, with: { (snapshot) in
            var value = snapshot.value as? Int
            if value == nil {
                value = 0
            }
            //code to execute to get the value
            self.tillButton.text = "You have completed till Advanced Day \(value!)"
        })
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        count = -1200
    }
    
}
