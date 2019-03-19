//
//  UIImageView+Extension.swift
//  SwiftProject
//
//  Created by Duntech on 2018/9/5.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import UIKit

extension UIImageView {
    
    /// 设置图片圆角
    func circleImage() {
        /// 建立上下文
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0)
        /// 获取当前上下文
        let ctx = UIGraphicsGetCurrentContext()
        /// 添加一个圆，并裁剪
        ctx?.addEllipse(in: self.bounds)
        ctx?.clip()
        /// 绘制图像
        self.draw(self.bounds)
        /// 获取绘制的图像
        let image = UIGraphicsGetImageFromCurrentImageContext()
        /// 关闭上下文
        UIGraphicsEndImageContext()
    
        DispatchQueue.global().async {
            self.image = image
        }
    }
    
    /// EZSE: Convenince init that takes coordinates of bottom left corner, height width and image name.
    public convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, imageName: String? = nil) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        if let name = imageName {
            self.image = UIImage(named: name)
        }
    }
    
    /// EZSE: Convenience init that takes coordinates of bottom left corner, image name and scales image frame to width.
    public convenience init(x: CGFloat, y: CGFloat, imageName: String, scaleToWidth: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: 0, height: 0))
        image = UIImage(named: imageName)
        if image != nil {
            scaleImageFrameToWidth(width: scaleToWidth)
        } else {
            assertionFailure("EZSwiftExtensions Error: The imageName: '\(imageName)' is invalid!!!")
        }
    }
    
    /// EZSE: Convenience init that takes coordinates of bottom left corner, width height and an UIImage Object.
    public convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, image: UIImage) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        self.image = image
    }
    
    /// EZSE: Convenience init that coordinates of bottom left corner, an UIImage object and scales image from to width.
    public convenience init(x: CGFloat, y: CGFloat, image: UIImage, scaleToWidth: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: 0, height: 0))
        self.image = image
        scaleImageFrameToWidth(width: scaleToWidth)
    }
    
    /// EZSE: scales this ImageView size to fit the given width
    public func scaleImageFrameToWidth(width: CGFloat) {
        guard let image = image else {
            print("EZSwiftExtensions Error: The image is not set yet!")
            return
        }
        let widthRatio = image.size.width / width
        let newWidth = image.size.width / widthRatio
        let newHeigth = image.size.height / widthRatio
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newWidth, height: newHeigth)
    }
    
    /// EZSE: scales this ImageView size to fit the given height
    public func scaleImageFrameToHeight(height: CGFloat) {
        guard let image = image else {
            print("EZSwiftExtensions Error: The image is not set yet!")
            return
        }
        let heightRatio = image.size.height / height
        let newHeight = image.size.height / heightRatio
        let newWidth = image.size.width / heightRatio
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newWidth, height: newHeight)
    }
    
    /// EZSE: Rounds up an image by clipping the corner radius to one half the frame width.
    public func roundSquareImage() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
    

    
  
}
