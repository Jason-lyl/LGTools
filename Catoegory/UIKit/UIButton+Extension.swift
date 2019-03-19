//
//  UIButton+Extension.swift
//  SmartOffice
//
//  Created by Duntech on 2018/10/19.
//  Copyright © 2018年 Jack Hu All rights reserved.
//

import UIKit

extension UIButton {
    
    func setNormal(title: String?) {
        self.setTitle(title, for: UIControl.State.normal)
    }
    
    func normalTitle() -> String? {
        return title(for: .normal)
    }
    
    func setSelected(title: String?) {
        self.setTitle(title, for: .selected)
    }
    
    func selectedTitle() -> String? {
        return title(for: .selected)
    }
    
    func setHighlighted(title: String?) {
        self.setTitle(title, for: .highlighted)
    }
    
    func highlightedTitle() -> String? {
        return title(for: .highlighted)
    }
    
    //MARK: - TitleColor
    func setNormal(titleColor: UIColor?) {
        self.setTitleColor(titleColor, for: .normal)
    }
    
    func normalTitleColor() -> UIColor? {
        return titleColor(for: .normal)
    }
    
    func setSelected(titleColor: UIColor?) {
        self.setTitleColor(titleColor, for: .selected)
    }
    
    func selectedTitleColor() -> UIColor? {
        return titleColor(for: .selected)
    }
    
    func setHighlighted(titleColor: UIColor?) {
        self.setTitleColor(titleColor, for: .highlighted)
    }
    
    func highlightedTitleColor() -> UIColor? {
        return titleColor(for: .highlighted)
    }
    
    //MARK: - Image
    func setNormal(image: UIImage?) {
        self.setImage(image, for: .normal)
    }
    
    func normalImage() -> UIImage? {
        return image(for: .normal)
    }
    
    func setSelected(image: UIImage?) {
        self.setImage(image, for: .selected)
    }
    
    func selectedImage() -> UIImage? {
        return image(for: .selected)
    }
    
    func setHighlighted(image: UIImage?) {
        self.setImage(image, for: .highlighted)
    }
    
    func highlightedImage() -> UIImage? {
        return image(for: .highlighted)
    }
    
    //MARK: - BackgroundImage
    func setNormal(backgroundImage: UIImage?) {
        self.setBackgroundImage(backgroundImage, for: .normal)
    }
    
    func normalBackgroundImage() -> UIImage? {
        return backgroundImage(for: .normal)
    }
    
    func setSelected(backgroundImage: UIImage?) {
        self.setBackgroundImage(backgroundImage, for: .selected)
    }
    
    func selectedBackgroundImage() -> UIImage? {
        return backgroundImage(for: .selected)
    }
    
    func setHighlighted(backgroundImage: UIImage?) {
        self.setBackgroundImage(backgroundImage, for: .highlighted)
    }
    func highlightedBackgroundImage() -> UIImage? {
        return backgroundImage(for: .highlighted)
    }
    
    public func setBackgroundColor(_ color: UIColor, forState: UIControl.State) {
        
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()?.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.setBackgroundImage(colorImage, for: forState)
    }
    
    
    /// 圆角
    ///
    /// - Parameters:
    ///   - borderWidth: 边框宽度
    ///   - borderColor: 边框颜色
    ///   - cornerRadius: 圆角半径
    func set(borderWidth: CGFloat?, borderColor: UIColor?, cornerRadius: CGFloat?) {
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.masksToBounds = true
        layer.borderWidth = borderWidth!
        layer.borderColor = borderColor?.cgColor
        layer.cornerRadius = cornerRadius!
    }
    
    /// 快速创建按钮(全)
    ///
    /// - Parameters:
    ///   - imageName: 图片
    ///   - titleColor: 字体颜色
    ///   - titleFont: 字体大小
    ///   - backgroundColor: 背景颜色
    ///   - title: 标题
    /// - Returns: button
    static func buttonWith(imageName: String?, titleColor: UIColor?, titleFont: UIFont?, backgroundColor: UIColor?, title: String?) -> UIButton {
        let button = UIButton(type: .custom)
        button.backgroundColor = backgroundColor
        if title?.count != nil {
            button.setTitle(title, for: .normal)
            button.setTitleColor(titleColor, for: .normal)
        }
        if titleFont != nil {
            button.titleLabel?.font = titleFont
        }
        if (imageName?.count) != nil {
            button.setImage(UIImage(named: imageName!), for: .normal)
            if title?.count != nil {
                button.titleEdgeInsets = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.size.width / 375, bottom: 0, right: 0)
                button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.size.width / 375)
            }
        }
        return button
    }
    
    /// 快速创建按钮(无图片)
    ///
    /// - Parameters:
    ///   - titleColor: 字体颜色
    ///   - titleFont: 字体大小
    ///   - backgroundColor: 背景颜色
    ///   - title: 标题
    /// - Returns: button
    static func buttonWith(titleColor: UIColor?, titleFont: UIFont?, backgroundColor: UIColor?, title: String?) -> UIButton {
        return UIButton.buttonWith(imageName: nil, titleColor: titleColor, titleFont: titleFont, backgroundColor: backgroundColor, title: title)
    }
    
    /// 快速创建按钮（图片）
    ///
    /// - Parameters:
    ///   - imageName: 图片
    ///   - backgroundColor: 背景颜色
    /// - Returns: button
    static func buttonWith(imageName: String?,backgroundColor: UIColor?) -> UIButton {
        return UIButton.buttonWith(imageName: imageName, titleColor: nil, titleFont: nil, backgroundColor: backgroundColor, title: nil)
    }
    
    /// 快速创建按钮(背景颜色)
    ///
    /// - Parameters:
    ///   - backgroundColor: 背景颜色
    /// - Returns: button
    static func buttonWith(backgroundColor: UIColor?) -> UIButton {
        return UIButton.buttonWith(imageName: nil, titleColor: nil, titleFont: nil, backgroundColor: backgroundColor, title: nil)
    }
    
    
    //MARK: - 自由设置Button
    func setCustomButton(image anImage: UIImage?, title: String,
             titlePosition: UIView.ContentMode, additionalSpacing: CGFloat, state: UIControl.State){
        
        self.imageView?.contentMode = .center
        self.setImage(anImage, for: state)
        
        positionLabelRespectToImage(title: title, position: titlePosition, spacing: additionalSpacing)
        
        self.titleLabel?.contentMode = .center
        self.setTitle(title, for: state)
    }
    
    private func positionLabelRespectToImage(title: String, position: UIView.ContentMode,
                                             spacing: CGFloat) {
        
        let imageSize = self.imageRect(forContentRect: self.frame)
        let titleFont = self.titleLabel?.font!
        
        let titleStr : NSString = title as NSString
        let titleSize = titleStr.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : titleFont!], context: nil)
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch (position){
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                                       right: -(titleSize.width * 2 + spacing))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: -spacing/2, bottom: 0, right: spacing)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
    
     func positionImage(position: UIView.ContentMode, spacing: CGFloat) {
        
        var imageInsets: UIEdgeInsets
        let width = self.frame.width / 2
        
        
        switch (position){
        case .top:
            imageInsets = UIEdgeInsets(top: spacing, left: 0, bottom: 0, right: 0)
        case .bottom:
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -spacing, right: 0)
        case .left:
            imageInsets = UIEdgeInsets(top: 0, left: spacing - width, bottom: 0, right: 0)
        case .right:
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
        default:
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.imageEdgeInsets = imageInsets
    }

    
    
    func layoutButton(imageTitleSpace: CGFloat) {
        
        //得到imageView和titleLabel的宽高
        let imageWidth = self.imageView?.frame.size.width
        let imageHeight = self.imageView?.frame.size.height
        
        var labelWidth: CGFloat! = 0.0
        var labelHeight: CGFloat! = 0.0
        
        labelWidth = self.titleLabel?.intrinsicContentSize.width
        labelHeight = self.titleLabel?.intrinsicContentSize.height
        
        //初始化imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero

        //重点： 修改imageEdgeInsets和labelEdgeInsets的相对位置的计算
        imageEdgeInsets = UIEdgeInsets(top: -labelHeight - imageTitleSpace / 2, left: 0, bottom: 0, right: -labelWidth)
        labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth!, bottom: -imageHeight!-imageTitleSpace/2, right: 0)
        
        
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
        
    }
 
    
}

extension UIButton {
    
    /**
     UIButton图像文字同时存在时---图像相对于文字的位置
     
     - top:    图像在上
     - left:   图像在左
     - right:  图像在右
     - bottom: 图像在下
     */
    enum ButtonImageEdgeInsetsStyle {
        case top, left, right, bottom
    }
    
    func imagePosition(at style: ButtonImageEdgeInsetsStyle, space: CGFloat) {
        
        guard let titleLab = self.titleLabel, let imgView = self.imageView else {
            return
        }
        
        //得到imageView和titleLabel的宽高
        let imageWidth = imgView.frame.size.width
        let imageHeight = imgView.frame.size.height
        
        let labelWidth = titleLab.frame.size.width
        let labelHeight = titleLab.frame.size.height
        
        let imageX = imgView.frame.origin.x
        let labelX = titleLab.frame.origin.x
        
        let margin = labelX - imageX - imageWidth
        
        //初始化imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero
        
        //根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch style {
        case .top:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight - space, left: labelWidth / 2 + margin / 2 + imageX, bottom: (labelHeight + space) / 2, right: (labelWidth - margin) / 2)
            labelEdgeInsets = UIEdgeInsets(top: 0.5 * (imageHeight + space), left: -(imageWidth - 5), bottom: -0.5 * imageHeight, right: 5)
            
        case .bottom:
            imageEdgeInsets = UIEdgeInsets(top: 0.5 * (labelHeight + space), left: 0.5 * labelWidth + imageX, bottom: -0.5 * labelHeight, right: 0.5 * labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -0.5 * imageHeight, left: -(imageWidth - 5), bottom:0.5 * (imageHeight + space), right: 5)
            
        case .right:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0.5 * (labelWidth + space), bottom: 0, right: -(labelWidth + 0.5 * space))
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -(imageWidth + 0.5 * space), bottom: 0, right: imageWidth + space * 0.5)
            
        default:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0.5 * space)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: 0.5 * space, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
    }
}
