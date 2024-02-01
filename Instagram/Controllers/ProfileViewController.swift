//
//  View.swift
//  Instagram
//
//  Created by Jason Yang on 1/29/24.
//

import UIKit
import CoreData
// 코어데이터 응용방법을 모르겠다. 강의 내용을 어떻게 사용하는 것일까? 활용방법은 어디서 찾는거지...

class ProfileViewController: UIViewController {
    
    var persistentContainer: NSPersistentContainer? {
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    }
    
    var userName: UILabel!
    var userAge: UILabel!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        createUser(name: "양준현", age: 100)
        
        readUser()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        userName = UILabel()
        userName.frame = CGRect(x: 0, y: 0, width: 10, height: 22)
        userName.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        userName.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        userName.textAlignment = .center
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.text = "양준현"
        view.addSubview(userName)
        
        userAge = UILabel()
        userAge.frame = CGRect(x: 0, y: 0, width: 10, height: 22)
        userAge.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        userAge.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        userAge.textAlignment = .center
        userAge.translatesAutoresizingMaskIntoConstraints = false
        userAge.text = "100"
        view.addSubview(userAge)
        
        NSLayoutConstraint.activate([
            userName.widthAnchor.constraint(equalToConstant: 100),
            userName.heightAnchor.constraint(equalToConstant: 22),
            userName.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            userName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            
            userAge.widthAnchor.constraint(equalToConstant: 100),
            userAge.heightAnchor.constraint(equalToConstant: 22),
            userAge.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            userAge.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100)
            
        ])
    }
    
    func createUser(name: String, age: Int16) {
           guard let context = self.persistentContainer?.viewContext else { return }

           let user = Task(context: context)
           user.title = name
           user.age = age

           do {
               try context.save()
           } catch let error as NSError {
               print("Could not save. \(error), \(error.userInfo)")
           }
       }
    
    func readUser() {
        guard let context = self.persistentContainer?.viewContext else { return }
        
        let request = Task.fetchRequest()
        let users = try? context.fetch(request)
        
        if let user = users?.first {
            userName.text = user.title
            userAge.text = "\(user.age)"
        }
    }
    
    func updateUser(name: String, newName: String, newAge: Int16) {
            guard let context = self.persistentContainer?.viewContext else { return }

            let fetchRequest = Task.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "name == %@", name)

            do {
                let users = try context.fetch(fetchRequest)
                for user in users {
                    user.title = newName
                    user.age = newAge
                }
                try context.save()
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
    
    func deleteUser(name: String) {
            guard let context = self.persistentContainer?.viewContext else { return }

            let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest() // NSFetchRequest<Task> 타입의 객체를 반환을 명시
            fetchRequest.predicate = NSPredicate(format: "name == %@", name)

            do {
                let users = try context.fetch(fetchRequest)
                for user in users {
                    context.delete(user)
                }
                try context.save()
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
}

