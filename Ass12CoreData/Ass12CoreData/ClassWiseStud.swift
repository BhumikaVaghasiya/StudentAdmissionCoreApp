//
//  ClassWiseStud.swift
//  Ass12CoreData
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ClassWiseStud: UIViewController {
    public var a =  [String]()
    var note:String!
    var cls:String!
    
    private var noteArray = [Student]()
    private let myTableView = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noteArray = CoreDataHandler.shared.fetch()
        for i in noteArray {
            note = i.sclass
            if(a.contains(note)) == false {
                a.append(note)
            }
        }
        myTableView.reloadData()
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Classes"
        navigationController?.setNavigationBarHidden(false, animated: true)
        view.backgroundColor = .white
        myTableView.reloadData()
        setupTableView()
        view.addSubview(myTableView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTableView.frame = CGRect(x: 0, y: 10, width:view.frame.size.width, height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
}

extension ClassWiseStud :UITableViewDataSource,UITableViewDelegate {
    private func setupTableView()
    {
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Classcell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return a.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Classcell", for: indexPath)
        cell.textLabel?.text = a[indexPath.row]
        cell.layer.cornerRadius = 20
        cell.backgroundColor = #colorLiteral(red: 0.6717784405, green: 0.753040731, blue: 0.9284328818, alpha: 1)
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 4
        cell.layer.shadowRadius = 3
        cell.layer.shadowOpacity = 0.4
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(a[indexPath.row])
        let vc = StudListClassWise()
        vc.selClass = a[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}
