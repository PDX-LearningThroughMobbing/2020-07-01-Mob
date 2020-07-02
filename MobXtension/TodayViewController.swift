//
//  TodayViewController.swift
//  MobXtension
//
//  Created by Viranchee L on 02/07/20.
//  Copyright © 2020 Sam Foulger. All rights reserved.
//

import UIKit
import SwiftUI
import NotificationCenter

class TodayViewController: UIHostingController<BodyView>, NCWidgetProviding {

    override var body: BodyView {
        BodyView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}

struct BodyView : View {
    var body: BodyView.Body {
        HStack {
            Text("00:00:00")
            Text("0000")
            Text("00")
        }
    }
}
