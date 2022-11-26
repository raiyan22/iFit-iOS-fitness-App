//
//  Beg1ViewController.swift
//  iFit
//
//  Created by Alvi Ahmmed Nabil on 10/29/21.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseDatabase

class Int1ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var refUser: DatabaseReference!
    @IBOutlet var table: UITableView!
    var databaseHandle: DatabaseHandle?
    @IBOutlet var topname3: UILabel!
    var fcount = 0
    var list = ["Barbell Squats x15","Walking Lunges x10","Deadlifts x5","Treadmill 10 Minutes","Plate Transfer Plank 60 Seconds"]
    let array = [20,5,15,10,12]
    var flag = [0,0,0,0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate=self
        table.dataSource=self
        refUser = Database.database().reference().child("users")
        topname3.text = "Day \(fcount+1)"
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.textLabel?.text = list[indexPath.row]
        //switch
        let switchView = UISwitch(frame: .zero)
        switchView.setOn(false, animated: true)
        switchView.tag = indexPath.row
        switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
        
        cell.accessoryView = switchView
        
        return cell
    }
    var a:Double = 0.0
    
        
    @objc func switchChanged (_ sender: UISwitch!){
            print("Table row changed \(sender.tag)")
            print("Switch on \(sender.isOn ? "On" : "OFF")")
        var i = sender.tag
        if (sender.isOn){
            flag[i] = 1
        }
        else{
            flag[i] = 0
        }
        a = 0
        for i in 0...4 {
            if flag[i] == 1 {
                a = a + Double(array[i])
            }
        }
        
    }
    func addinfo(){
           let key = Auth.auth().currentUser?.uid
           let user = [
            "CalorieBurned": String(a) as String
           ]
        var st = String(fcount+1)
        refUser.child(key!).child("Intermediate").child("Day \(st)").setValue(user)
        if(fcount == 0){
            refUser.child(key!).child("Intermediate").child("DayTill").setValue(1)
        }
        databaseHandle = refUser?.child(key!).child("Intermediate").child("DayTill").observe(.value, with: { (snapshot) in
            var ivalue = snapshot.value as? Int
            if ivalue==nil{
                ivalue = 0
            }
            var ivalue2 = Int(ivalue!)
            if(ivalue2<self.fcount+1){
                self.refUser.child(key!).child("Intermediate").child("DayTill").setValue(self.fcount+1)
            }
        })
       }
       @IBAction func confirmTapped(_ sender: UIButton) {
   
           addinfo()
       }
    
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        buttonConfirm.isEnabled = false
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = list[indexPath.row]
//        let mySwitch = UISwitch()
//
//        mySwitch.addTarget(self, action: #selector(didChangeSwitch(_:)), for: .valueChanged)
//        cell.accessoryView = mySwitch
//        print(indexPath.row)
//
//        return cell
//    }
//    var a=0
//
//    @objc func didChangeSwitch(_ sender: UISwitch) {
//
//        if sender.isOn{
//            print("Switch ON")
//            a = a+1
//
//
//        }
//        else
//        {
//            print("Switch OFF")
//            a = a - 1
//
//        }
//        print(a)
//        if (a == 5) {
//            buttonConfirm.isEnabled = true
//        }
//        else{
//            buttonConfirm.isEnabled = false
//        }
//    }
    
    
    
    

}
