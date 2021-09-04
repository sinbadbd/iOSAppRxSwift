//
//  UIView+Ext+Constants.swift
//  UIView+Ext+Constants
//
//  Created by Imran on 24/8/21.
//

import UIKit

extension UIView {
    @discardableResult
    public func position(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, insets: UIEdgeInsets = .zero) -> LayoutConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var layoutConstraints = LayoutConstraints()
        
        if let top = top {
            layoutConstraints.top = topAnchor.constraint(equalTo: top, constant: insets.top)
        }
        
        if let left = left {
            layoutConstraints.left = leadingAnchor.constraint(equalTo: left, constant: insets.left)
        }
        
        if let bottom = bottom {
            layoutConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -insets.bottom)
        }
        
        if let right = right {
            layoutConstraints.right = trailingAnchor.constraint(equalTo: right, constant: -insets.right)
        }
        
        [layoutConstraints.top, layoutConstraints.left, layoutConstraints.bottom, layoutConstraints.right].forEach{ $0?.isActive = true }
        
        return layoutConstraints
    }
    
    @discardableResult
    public func size(wAnchor:NSLayoutConstraint? = nil, hAnchor:NSLayoutConstraint? = nil, width: CGFloat = 0, height: CGFloat = 0, dimensionWidth:NSLayoutDimension? = nil, dimensionHeight:NSLayoutDimension? = nil, widthPriority:Float? = 1000, heightPriority:Float? = 1000 ) -> LayoutConstraints {
        
        //translatesAutoresizingMaskIntoConstraints = false
        var layoutConstraints = LayoutConstraints()
        
        if width != 0 {
            layoutConstraints.width = widthAnchor.constraint(equalToConstant: width)
        }else if wAnchor != nil {
            layoutConstraints.width = wAnchor
        }else if dimensionWidth != nil {
            layoutConstraints.width = widthAnchor.constraint(equalTo: dimensionWidth!)
        }
        
        if height != 0 {
            layoutConstraints.height = heightAnchor.constraint(equalToConstant: height)
        }else if hAnchor != nil {
            layoutConstraints.height = hAnchor
        }else if dimensionHeight != nil {
            layoutConstraints.height = heightAnchor.constraint(equalTo: dimensionHeight!)
        }
        layoutConstraints.width?.priority = UILayoutPriority(rawValue: widthPriority!)
        layoutConstraints.height?.priority = UILayoutPriority(rawValue: heightPriority!)
        [layoutConstraints.width, layoutConstraints.height].forEach{ $0?.isActive = true }
        
        return layoutConstraints
    }
    
    @discardableResult
    public func sizeFrom(view:UIView) -> LayoutConstraints {
        
        //translatesAutoresizingMaskIntoConstraints = false
        var layoutConstraints = LayoutConstraints()
        
        layoutConstraints.width = widthAnchor.constraint(equalTo: view.widthAnchor)
        layoutConstraints.height = heightAnchor.constraint(equalTo: view.heightAnchor)
        
        [layoutConstraints.width, layoutConstraints.height].forEach{ $0?.isActive = true }
        
        return layoutConstraints
    }
    
    
    
    public func updateWidth(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    public func updateHeight(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    public  func fitToSuper(insets: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: insets.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -insets.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: insets.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -insets.right).isActive = true
        }
    }
    
    public func centerInSuper(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    public func centerXInSuper() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superViewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superViewCenterXAnchor).isActive = true
        }
    }
    
    public func centerYInSuper() {
        translatesAutoresizingMaskIntoConstraints = false
        if let centerY = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
    
    
    @discardableResult
    public func setFrame(_ size: CGSize) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self
    }
    
    @discardableResult
    public func setHeight(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    public func setWidth(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
}

public struct LayoutConstraints {
    var top, left, bottom, right, width, height: NSLayoutConstraint?
}
