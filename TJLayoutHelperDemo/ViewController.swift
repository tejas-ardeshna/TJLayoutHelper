//
//  ViewController.swift
//  TJLayoutHelperDemo
//
//  Created by Tejas Ardeshna on 24/02/18.
//  Copyright © 2018 Tejas Ardeshna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var consBlueViewTop: TJLayoutHelper!
    
    func modifyConstraintAccordingToScreenSize() {
        switch UIDevice.current.screenType {
        case .iPhones_5_5s_5c_SE:
            consBlueViewTop.constant += 5 //Add 5 pixel more space for 4 inch device
        case .iPhones_6_6s_7_8:
            consBlueViewTop.constant += 7  // Add 7 pixel more space for 4.7 inch device
        case .iPhones_6Plus_6sPlus_7Plus_8Plus:
            consBlueViewTop.constant += 10 // Add 10 pixel more space for 5.5 inch device
        case .iPhoneX:
            consBlueViewTop.constant += 15 // And add 15 pixel space for iPhone X
        default:
            break
        }
        consBlueViewTop.inch5_5Space = 20
        consBlueViewTop.XSpace       = 30
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
