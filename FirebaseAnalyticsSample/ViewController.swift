//
//  ViewController.swift
//  FirebaseAnalyticsSample
//
//  Created by satoshi.marumoto on 2020/05/07.
//  Copyright © 2020 satoshi.marumoto. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // クラッシュボタン
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
        button.backgroundColor = .red
        button.setTitle("Crash", for: [])
        button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @IBAction func buttonTapped() {
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
            AnalyticsParameterItemID: "id-001",
            AnalyticsParameterItemName: "登録ボタン",
            AnalyticsParameterContentType: "コンテンツタイプ"
        ])
    }
    
    @IBAction func buttonTapped2() {
        Analytics.logEvent("share_image", parameters: [
            "name": "シェア" as NSObject,
            "full_text": "シェア" as NSObject
        ])
    }
    
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
        _ = [0, 1][2]
        Crashlytics.setValue("crashButton_tapped", forKey: "crashButton_tapped_action")
        Crashlytics.crashlytics().log("crashButton_tappedで落ちました")
        Crashlytics.crashlytics().setUserID("1234")
    }

}

