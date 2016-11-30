//
//  jsonEngine.swift
//  FlickrAPIKitten
//
//  Created by Peter Leung on 30/11/2016.
//  Copyright © 2016 winandmac Media. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class jsonEngine{
    
    var posts = [Posts]()
    
    func getPosts(getposts : String)
    {
        
        Alamofire.request(getposts, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: [:]).responseJSON { (response) in
            guard let data = response.result.value else{
                print("Request failed")
                return
            }
            var jsonDATA = JSON(data)
            guard let totalCount = jsonDATA["items"].array?.count else {
                return
            }
            print("Now Total Count is \(totalCount)")
            for x in 0..<totalCount {
                let objOutput = jsonDATA["items"][x]["media"]["m"]
                let po = Posts(inputImgLink: objOutput.string!)
                self.posts.append(po)
            }
            NotificationCenter.default.post(name: .reloadTableView, object: nil)
        }
    }
    
}

extension Notification.Name {
    static let reloadTableView = Notification.Name("reloadTableView")
}
