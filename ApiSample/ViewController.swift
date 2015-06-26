//
//  ViewController.swift
//  ApiSample
//
//  Created by shinobu okano on 2015/06/25.
//  Copyright (c) 2015年 shinobu okano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func load(sender: AnyObject) {
//        let url = NSURL(string: "http://express.heartrails.com/api/json?method=getPrefectures")
//        let urlRequest = NSURLRequest(URL: url!)
//        let connection: NSURLConnection = NSURLConnection(request: urlRequest, delegate: self, startImmediately: false)!
//
//        NSURLConnection.sendAsynchronousRequest(urlRequest,
//            queue: NSOperationQueue.mainQueue(),
//            completionHandler: response)
        
        let manager = AFHTTPRequestOperationManager()
        manager.requestSerializer = AFHTTPRequestSerializer()
        manager.GET("http://express.heartrails.com/api/json?method=getPrefectures", parameters: nil,
            success: {(operation: AFHTTPRequestOperation!, responsobject: AnyObject!) in
                println("Success!!")
                println(responsobject)
            },
            failure: {(operation: AFHTTPRequestOperation!, error: NSError!) in
                println("Error!!")
            }
        )
    }

    func response(res: NSURLResponse!, data: NSData!, error: NSError!){
        let json:NSDictionary = NSJSONSerialization.JSONObjectWithData(data,
            options: NSJSONReadingOptions.AllowFragments, error: nil) as! NSDictionary
        
        let res:NSDictionary = json.objectForKey("response") as! NSDictionary
        let pref:NSArray = res.objectForKey("prefecture") as! NSArray
        
        for var i=0 ; i<pref.count ; i++ {
            println(pref[i])
        }
    }
}