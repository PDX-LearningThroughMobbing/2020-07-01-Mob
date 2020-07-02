//
//  SceneDelegate.swift
//  2020-07-01 Mob
//
//  Created by selfoulger on 7/1/20.
//  Copyright © 2020 Sam Foulger. All rights reserved.
//

import SwiftUI


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        let view = Hello()
        window?.rootViewController = UIHostingController(rootView: view)
    }

}
