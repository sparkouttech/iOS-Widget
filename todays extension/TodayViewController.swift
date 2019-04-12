//
//  TodayViewController.swift
//  todays extension
//
//  Created by Rider on 11/04/19.
//  Copyright © 2019 Karmadust. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    let date = Date()
    let formatter = DateFormatter()
    
    @IBOutlet weak var lblDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDate()
        // Do any additional setup after loading the view.
    }
    
    func getDate() {
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        lblDate.text = result
    }
    
    @IBAction func btnLaunch(_ sender: Any) {
        if let url = URL(string: "open://\((sender as AnyObject).tag)")
        {
            self.extensionContext?.open(url, completionHandler: nil)
        }
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
