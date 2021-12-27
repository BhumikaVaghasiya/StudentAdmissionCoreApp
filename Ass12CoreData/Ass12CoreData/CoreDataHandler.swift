//
//  CoreDataHandler.swift
//  Ass12CoreData
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class CoreDataHandler {
    
    static let shared = CoreDataHandler()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let manageObjectContext: NSManagedObjectContext?
    
    private init() {
        manageObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    func save() {
        appDelegate.saveContext()
    }
    
    func insert(spid: Int, sname: String, sclass: String, phone: String, password: String, completion: @escaping () -> Void) {
        let stud = Student(context: manageObjectContext!)
            stud.spid = Int64(spid)
            stud.sname = sname
            stud.sclass = sclass
            stud.phone = phone
            stud.password = password
        save()
        completion()
    }
    
    func update(stud:Student, sname: String, sclass: String, phone: String, password: String, completion: @escaping () -> Void) {
        stud.sname = sname
        stud.sclass = sclass
        stud.phone = phone
        stud.password = password

        save()
        completion()
    }

    func delete(stud:Student, completion: @escaping () -> Void) {
        manageObjectContext!.delete(stud)

        save()
        completion()
    }

    func fetch() -> [Student] {
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        
        do {
            let studArray = try manageObjectContext?.fetch(fetchRequest)
            return studArray!
        } catch {
            print(error)
            return [Student]()
        }
        
    }
    
    func insertNotice(title: String, descriptions: String, completion: @escaping () -> Void) {
        let no = Notice(context: manageObjectContext!)
        no.title = title
        no.descriptions = descriptions
        save()
        completion()
    }
    
    func updateNotice(no:Notice,title: String, descriptions: String, completion: @escaping () -> Void) {
        no.title = title
        no.descriptions = descriptions
        save()
        completion()
    }
    
    func deleteNotice(no:Notice, completion: @escaping () -> Void) {
        manageObjectContext!.delete(no)
        save()
        completion()
    }
    
    func fetchNotice() -> [Notice] {
        let fetchRequest:NSFetchRequest<Notice> = Notice.fetchRequest()
        
        do {
            let noArray = try manageObjectContext?.fetch(fetchRequest)
            return noArray!
        } catch {
            print(error)
            return [Notice]()
        }
    }
    
    func fetchClassWise(sclass:String) -> [Student] {
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "sclass contains %@",sclass)
        
        do {
            let studArray = try manageObjectContext?.fetch(fetchRequest)
            return studArray!
        } catch {
            print(error)
            return [Student]()
        }
    }
    
    func chekLogin(spid:Int) -> Student {
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "spid contains %i",spid)
        do {
            let studArray = try manageObjectContext?.fetch(fetchRequest)
            return studArray![0]
        } catch {
            print(error)
            return Student()
        }
    }
    
    func StudUpdatePwd(stud:Student, pwd: String,completion: @escaping () -> Void){
        stud.password = pwd
        save()
        completion()
    }
    
}
