//
//  ViewController.swift
//  Mckinley&RiceDemo
//
//  Created by Kriti Agarwal on 05/01/20.
//  Copyright © 2020 Kriti Agarwal. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK:- @IBOutlets
    @IBOutlet weak var txtuserId: UITextField!
    @IBOutlet weak var txtUserPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    //MARK:- Variables
    let leftIdView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 5.0, height: 2.0))
    let leftPasswordView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 5.0, height: 2.0))
    
    //MARK:- Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }

    func addSubviews() {
        txtuserId.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        txtUserPassword.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        txtuserId.layer.borderWidth = 2
        txtUserPassword.layer.borderWidth = 2
        txtuserId.leftView = leftIdView
        txtuserId.leftViewMode = .always
        txtUserPassword.leftView = leftPasswordView
        txtUserPassword.leftViewMode = .always
        btnLogin.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        btnLogin.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        btnLogin.layer.shadowOpacity = 1.0
        btnLogin.layer.shadowRadius = 0.0
        btnLogin.layer.masksToBounds = false
        btnLogin.layer.cornerRadius = 4.0
    }
    
    //MARK:- @IBActions
    @IBAction func didTapLoginBtn(_ sender: UIButton) {
        let id = txtuserId.text ?? ""
        let password = txtUserPassword.text ?? ""
        login(id: id, password: password)
    }
    
    //MARK:- Login Request
    func login(id: String, password: String) {
        var parameters:Parameters = [String : Any]()
        parameters["email"] = id
        parameters["password"] = password
        
        Alamofire.request(loginUrl, method: .post, parameters: parameters , encoding: JSONEncoding.default)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    let swiftyJson = JSON(value)
                    print ("return as JSON using swiftyJson is: \(swiftyJson)")
                    let responseValue = response.value as? [String: Any]
                    let token = responseValue?["id"]
                    let sb = UIStoryboard.init(name: "Main", bundle: nil)
                    let webVC = sb.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                    webVC.urlStr = token as? String
                    self.navigationController?.pushViewController(webVC, animated: true)
                    print(value)
                case .failure(let error):
                    print ("error: \(error)")
                }

        }
    }
    
}

