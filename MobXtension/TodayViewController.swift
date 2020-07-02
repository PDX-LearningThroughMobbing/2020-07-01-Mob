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

class TodayViewController: UIViewController, NCWidgetProviding {
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder, rootView: BodyView())
//    }
    
    

    override func viewDidLoad() {
        print("load")
        super.viewDidLoad()
        
        

//        controller.view.translatesAutoresizingMaskIntoConstraints = false

        
//        rootView = BodyView()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let bodyView = BodyView()
        let controller = UIHostingController(rootView: bodyView)
        
        addChild(controller)
        self.view.addSubview(controller.view)
        controller.view.frame = view.bounds
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
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
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .long
        return formatter.string(from: Date())
    }
    
    func setTime() {
        
    }
    
    @State private var currentTime: String = ""
    @State private var counter: Int = 0
    @State private var randomCounter: Int = 0

    
    var body: some View {
        HStack {
            Text(verbatim: currentTime)
            Text(verbatim: "\(counter)")
            Text(verbatim: "\(randomCounter)")
        }
        .onReceive(Timer.publish(every: 1.0, on: RunLoop.main, in: .default).autoconnect()) { _ in
            self.currentTime = self.getCurrentTime()
            self.counter += 1
            self.randomCounter += Int.random(in: 1...10)
        }
    }
}

struct TodayViewController_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
