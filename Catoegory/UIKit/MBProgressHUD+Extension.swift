//
//  MBProgressHUD+Extension.swift
//  SwiftProject
//
//  Created by Duntech on 2018/9/6.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import UIKit
import MBProgressHUD

extension MBProgressHUD {
    
    //显示等待消息
    class func showWait(title: String = "loading...", onView: UIView = topWindowView()) {
        
        let hud = MBProgressHUD.showAdded(to: onView, animated: true)
        hud.label.text = title
        hud.bezelView.backgroundColor = .black
        UIActivityIndicatorView.appearance(whenContainedInInstancesOf: [MBProgressHUD.self]).backgroundColor = .white
        hud.label.textColor = .white
        hud.margin = 20
    }
    
    //显示普通消息
    class func showInfo(title: String, imageName : String,  _ onView: UIView = topWindowView()) {
        
        let hud = MBProgressHUD.showAdded(to: onView, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        let imageView = UIImageView(image: UIImage(named: imageName))
        hud.customView = imageView
        hud.label.text = title
        hud.label.textColor = .white
        
//        let titleWidth = (title.width(kAdaptedWidth(20), font: kFitFont(16)) + 30 ) > kAdaptedWidth(100) ?  title.width(kAdaptedWidth(20), font: kFitFont(16)) + 30 : kAdaptedWidth(100)
//
//        let customView = UIView(frame: CGRect(x: 0, y: 0, width: titleWidth, height: kAdaptedWidth(100)))
//        let imageView = UIImageView(image: UIImage(named: imageName)!) //自定义视图显示图片
//        customView.addSubview(imageView)
//        imageView.snp.makeConstraints { (make) in
//            make.top.equalTo(customView).offset(kAdaptedWidth(20))
//            make.centerX.equalTo(customView)
//            make.width.height.equalTo(kAdaptedWidth(30))
//        }
//
//        let titleLabel = UILabel()
//        titleLabel.text = title
//        titleLabel.textAlignment = .center
//        customView.addSubview(titleLabel)
//        titleLabel.textColor = kAppWhiteColor
//        titleLabel.font = kFitSystemFont(16, weight: .bold)
//        customView.addSubview(titleLabel)
//        titleLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(imageView.snp.bottom).offset(kAdaptedWidth(6))
//            make.left.right.equalTo(customView)
//        }
//
////        hud.customView?.frame = CGRect(x: 0, y: 0, width: titleWidth, height: kAdaptedWidth(100))
////        hud.bezelView.addSubview(customView)
//        hud.customView = customView
//        hud.removeFromSuperViewOnHide = true
        
        hud.minSize = CGSize(width: kAdaptedWidth(100), height: kAdaptedWidth(100))
        
        hud.bezelView.backgroundColor = .black
        //HUD窗口显示1秒后自动隐藏
        hud.hide(animated: true, afterDelay: 2)
    }
    
    //显示成功消息
    class func showSuccess(_ title: String, _ onView: UIView = topWindowView()) {
        
        self.showInfo(title: title, imageName: "error_ic_successful", onView)
    }
    
    //显示失败消息
    class func showError(_ title: String, _ onView: UIView = topWindowView()) {
        
        self.showInfo(title: title, imageName: "error_ic_failure", onView)
    }
    
    class func showToast(_ text: String) {
        

        let HUD = self.showAdded(to: KeyWindow!, animated: true)
        HUD.mode = .text
        
        HUD.bezelView.backgroundColor = kAppBlackColor
        HUD.label.text = text
        HUD.contentColor = UIColor.white
        
        //显示对话框
        HUD.show(animated: true)
        HUD.hide(animated: true, afterDelay: 1.5)
        
    }
}

