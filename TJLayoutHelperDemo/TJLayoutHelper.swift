//
//  TJLayoutHelper.swift
//  TJLayoutHelperDemo
//
//  Created by Tejas Ardeshna on 07/12/17.
//  Copyright © 2017 Tejas Ardeshna. All rights reserved.
//

import UIKit

@IBDesignable class TJLayoutHelper: NSLayoutConstraint {

    // MARK: - Variables
    @IBInspectable var applyRatio: Bool = false {
        didSet {
            self.adjustSpaceForConstraint()
        }
    }
    
    @IBInspectable var XSpace: CGFloat = 0.0 {
        didSet {
            if UIDevice.current.screenType == .iPhoneX {
                self.adjustSpaceForConstraint()
            }
        }
    }
    
    @IBInspectable var inch4Space: CGFloat = 0.0 {
        didSet {
            if UIDevice.current.screenType == .iPhones_5_5s_5c_SE {
                self.adjustSpaceForConstraint()
            }
        }
    }
    
    @IBInspectable var inch4_7Space: CGFloat = 0.0 {
        didSet {
            if UIDevice.current.screenType == .iPhones_6_6s_7_8 {
                self.adjustSpaceForConstraint()
            }
        }
    }
    
    @IBInspectable var inch5_5Space: CGFloat = 0.0 {
        didSet {
            if UIDevice.current.screenType == .iPhones_6Plus_6sPlus_7Plus_8Plus {
                self.adjustSpaceForConstraint()
            }
        }
    }
    
    @IBInspectable var inch9_7_and_10_5: CGFloat = 0.0 {
        didSet {
            if UIDevice.current.screenType == .iPad {
                self.adjustSpaceForConstraint()
            }
        }
    }
    
    @IBInspectable var inch12_9: CGFloat = 0.0 {
        didSet {
            if UIDevice.current.screenType == .iPad_Pro {
                self.adjustSpaceForConstraint()
            }
        }
    }
    
    var isConstantAltered = false
    
    // MARK: -
    // MARK: - Initialisers
    override init() {
        super.init()
    }
    
    override func awakeFromNib() {
    }

    /// this method will identify device
    func adjustSpaceForConstraint() {
        if isConstantAltered { return }
        switch UIDevice.current.screenType {
        case .iPhones_5_5s_5c_SE:
            self.addConstant(addition: inch4Space)
        case .iPhoneX:
            self.addConstant(addition: XSpace)
        case .iPhones_6_6s_7_8:
            self.addConstant(addition: inch4_7Space)
        case .iPhones_6Plus_6sPlus_7Plus_8Plus:
            self.addConstant(addition: inch5_5Space)
        case .iPad:
            self.addConstant(addition: inch9_7_and_10_5)
        case .iPad_Pro:
            self.addConstant(addition: inch12_9)
        default:
            break
        }
        isConstantAltered = true // so constrain won't modify twice
    }

    /// this will add extra space according to device
    ///
    /// - Parameter addition: extra space in pixel
    func addConstant(addition : CGFloat)
    {
        // TODO:- Change screen type if you are designing in other devices rather then 4 inch iphone
        if applyRatio && UIDevice.current.screenType != .iPhones_5_5s_5c_SE
        {
            let h         = UIDevice.current.orientation == .portrait ? UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.width
            // TODO:- Change screen size  if you are designing in other devices rather then 4 inch iphone to your screen size
            let ratio     = self.constant * h / 568 // 568 because we have designed in iphone 5, modify if your desings in other iphone
            self.constant += (addition == 0.0 ? ratio : addition)
        }
        else
        {
            self.constant += addition
        }
    }

}

extension UIDevice {
    
    
    enum ScreenType: String {
        case iPhone4_4S = "iPhone 4 or iPhone 4S"
        case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
        case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
        case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
        case iPhoneX = "iPhone X"
        case iPad = "iPad"
        case iPad_Pro = "iPad Pro"
        case unknown // for future if there will be new screen size
    }
    
    // MARK: - Variables
    var iPhoneX: Bool {
        return UIScreen.main.nativeBounds.height == 2436
    }
    var iPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    var screenType: ScreenType {
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhone4_4S
        case 1136:
            return .iPhones_5_5s_5c_SE
        case 1334:
            return .iPhones_6_6s_7_8
        case 1920, 2208:
            return .iPhones_6Plus_6sPlus_7Plus_8Plus
        case 2436:
            return .iPhoneX
        case 2048:
            return .iPad
        case 2732:
            return .iPad_Pro
        default:
            return .unknown
        }
    }
}
