//
//  NewStudent.swift
//  Ass12CoreData
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class NewStudent: UIViewController {

    var student:Student?
    
    public let nameTextField1:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Student Name"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 25
        textField.layer.borderWidth = 1
        textField.textColor = #colorLiteral(red: 0.07158278674, green: 0.04828194529, blue: 0.1889750957, alpha: 1)
        textField.layer.borderColor = #colorLiteral(red: 0.07158278674, green: 0.04828194529, blue: 0.1889750957, alpha: 1)
        return textField
    }()
    public let classTextField2:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Class"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 25
        textField.layer.borderWidth = 1
        textField.textColor = #colorLiteral(red: 0.07158278674, green: 0.04828194529, blue: 0.1889750957, alpha: 1)
        textField.layer.borderColor = #colorLiteral(red: 0.07158278674, green: 0.04828194529, blue: 0.1889750957, alpha: 1)
        return textField
    }()
    public let phoneTextField3:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Mobile Number"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 25
        textField.layer.borderWidth = 1
        textField.textColor = #colorLiteral(red: 0.07158278674, green: 0.04828194529, blue: 0.1889750957, alpha: 1)
        textField.layer.borderColor = #colorLiteral(red: 0.07158278674, green: 0.04828194529, blue: 0.1889750957, alpha: 1)
        return textField
    }()
    public let pwdTextField4:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 25
        textField.layer.borderWidth = 1
        textField.textColor = #colorLiteral(red: 0.07158278674, green: 0.04828194529, blue: 0.1889750957, alpha: 1)
        textField.layer.borderColor = #colorLiteral(red: 0.07158278674, green: 0.04828194529, blue: 0.1889750957, alpha: 1)
        return textField
    }()
    private let MyButton:UIButton={
        let button=UIButton()
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(OnInsertButtonClick), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.07158278674, green: 0.04828194529, blue: 0.1889750957, alpha: 1)
        button.layer.cornerRadius = 25
        return button
    }()
    
    @objc func OnInsertButtonClick()
    {
        var num = String()
        for _ in 1...6 {
            num += "\(Int.random(in: 1...9))"
        }
        print(num)
        let sname = nameTextField1.text!
        let sclass = classTextField2.text!
        let phone = phoneTextField3.text!
        let password = pwdTextField4.text!
        
        if let stud = student {
            CoreDataHandler.shared.update(stud: stud, sname: sname, sclass: sclass, phone: phone, password: password) {
                print("data updated")
                self.reset()
            }
            navigationController?.popViewController(animated: true)
            
        }else {
            CoreDataHandler.shared.insert(spid: Int(num)!,sname: sname, sclass: sclass, phone: phone, password: password) {
            print("data inserted")
            self.reset()
            }
            navigationController?.popViewController(animated: true)
        }
    }
   
    
    private func reset() {
        student = nil
        nameTextField1.text = ""
        classTextField2.text = ""
        phoneTextField3.text = ""
        pwdTextField4.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:  UIImage(named: "bg")!)
        view.addSubview(nameTextField1)
        view.addSubview(classTextField2)
        view.addSubview(phoneTextField3)
        view.addSubview(pwdTextField4)
        view.addSubview(MyButton)
        
        if let stud = student {
            nameTextField1.text = stud.sname
            classTextField2.text = stud.sclass
            phoneTextField3.text = stud.phone
            pwdTextField4.text = stud.password
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nameTextField1.frame = CGRect(x: 27, y: view.safeAreaInsets.top + 120, width: view.width - 50, height: 50)
        classTextField2.frame = CGRect(x: 27, y:nameTextField1.bottom + 10, width: view.width - 50, height: 50)
        phoneTextField3.frame = CGRect(x: 27, y: classTextField2.bottom + 10, width: view.width - 50, height: 50)
        pwdTextField4.frame = CGRect(x: 27, y: phoneTextField3.bottom + 10, width: view.width - 50, height: 50)
        MyButton.frame = CGRect(x: 27, y: pwdTextField4.bottom + 40, width: view.width - 50, height: 50)
    }
    
}

