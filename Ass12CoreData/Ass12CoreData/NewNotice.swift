//
//  NewNotice.swift
//  Ass12CoreData
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class NewNotice: UIViewController {

    var notice:Notice?
    
    public let nameTextField1:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Title"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 25
        textField.layer.borderWidth = 1
        textField.textColor = #colorLiteral(red: 0.07158278674, green: 0.04828194529, blue: 0.1889750957, alpha: 1)
        textField.layer.borderColor = #colorLiteral(red: 0.07158278674, green: 0.04828194529, blue: 0.1889750957, alpha: 1)
        return textField
    }()
    public let classTextField2:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Description"
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
        let title = nameTextField1.text!
        let descriptions = classTextField2.text!
        
        if let note = notice {
            CoreDataHandler.shared.updateNotice(no: note, title: title, descriptions: descriptions) {
                print("Notice Updated")
                self.reset()
            }
            
            
        } else {
            CoreDataHandler.shared.insertNotice(title: title, descriptions: descriptions) {
                print("Notice Inserted")
                self.reset()
            }
        }
        navigationController?.popViewController(animated: true)
    }
   
    
    private func reset() {
        notice = nil
        nameTextField1.text = ""
        classTextField2.text = ""
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:  UIImage(named: "bg")!)
        navigationController?.setNavigationBarHidden(false, animated: true)
        view.addSubview(nameTextField1)
        view.addSubview(classTextField2)
        view.addSubview(MyButton)
        
        if let note = notice {
            nameTextField1.text = note.title
            classTextField2.text = note.descriptions
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nameTextField1.frame = CGRect(x: 27, y: view.safeAreaInsets.top + 180, width: view.width - 50, height: 50)
        classTextField2.frame = CGRect(x: 27, y:nameTextField1.bottom + 10, width: view.width - 50, height: 50)
        MyButton.frame = CGRect(x: 27, y: classTextField2.bottom + 20, width: view.width - 50, height: 50)
    }
    

}
