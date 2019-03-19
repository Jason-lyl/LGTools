//
//  WKWebView+Extension.swift
//  SmartBookingIPad
//
//  Created by Jason on 2019/1/3.
//  Copyright © 2019 Duntech. All rights reserved.
//

import WebKit
import UIKit


extension  WKWebView {

    
    public convenience init(frame: CGRect, superVC: UIViewController) {
        
        let config = WKWebViewConfiguration()
        let preference = WKPreferences()
        preference.javaScriptEnabled = true
        config.preferences = preference
        
        let userContent = WKUserContentController()
        userContent.add(superVC as! WKScriptMessageHandler, name: "show")
        config.userContentController = userContent
        
        self.init(frame: frame, configuration: config)
        self.backgroundColor = kAppWhiteColor
        self.uiDelegate = superVC as? WKUIDelegate
        self.navigationDelegate = superVC as? WKNavigationDelegate

        
    }
    
    func addProgressView() {
        
        let progressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: self.width, height: 1))
        progressView.progressTintColor = UIColor.blue
        progressView.transform = CGAffineTransform.init(scaleX: 1, y: 3)
        progressView.progress = 0.05
        
        
    }
}
