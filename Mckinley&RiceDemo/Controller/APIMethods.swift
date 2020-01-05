//
//  APIMethods.swift
//  Mckinley&RiceDemo
//
//  Created by Kriti Agarwal on 05/01/20.
//  Copyright © 2020 Kriti Agarwal. All rights reserved.
//

import UIKit
import Alamofire

class APIClient {
    
    static func login(email: String, password: String, completion:@escaping (Result<Any>)->Void) {
        Alamofire.request(APIRouter.login(email: email, password: password))
            .responseJSON { (response) in
                completion(response.result)
        }
    }
}
