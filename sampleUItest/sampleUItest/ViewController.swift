//
//  ViewController.swift
//  testUI
//
//  Created by admin on 2/16/17.
//  Copyright © 2017 admin. All rights reserved.
//


import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let backButton = UIButton(type: UIButtonType.Custom) as UIButton
        backButton.setImage(UIImage(named: "Group")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate), forState: UIControlState.Normal)
        backButton.setTitle("efewrtwertr", forState: UIControlState.Normal)
        backButton.frame = CGRectMake(10, 20, 150, 42)
        backButton.setTitleColor(UIColor.purpleColor(), forState: .Normal)
        //titleLabel = UIColor.purpleColor()
        backButton.accessibilityLabel = "btn"
        backButton.addTarget(self, action: #selector(tapped), forControlEvents: .TouchUpInside)
        self.view.addSubview(backButton)
        
        let label = UILabel(frame: CGRectMake(160, 20, 100, 42))
        label.backgroundColor = UIColor.purpleColor()
        label.text = "Hello"
        label.accessibilityLabel = "status"
        label.accessibilityValue = "vandanam"
        
        self.view.addSubview(label)
        
        let num = randomNumber(3)
        let pan = "AWRPA"+"\(num)"+"F"
        print(pan)
        
        
        
        let field = UITextField(frame: CGRectMake(100, 100, 205, 42))
        field.backgroundColor = UIColor.purpleColor()
        field.text = "MyField"
        field.accessibilityLabel = "field"
        self.view.addSubview(field)
        
        
    }
    
    func randomNumber(noOfDigits : UInt32) -> UInt32 {
        var place : UInt32 = 1
        var finalNumber : UInt32 = 0
        for _ in 0..<noOfDigits {
            place *= 10
            let randomNumber = arc4random_uniform(10)
            finalNumber += randomNumber * place
        }
        print(finalNumber)
        return finalNumber/1
        
        
    }
    func tapped() {
        
        //        for i in 20...11 {
        //            print(i)
        //        }
        //        return
        //
        //randomNumber(4)
        //  return
        
        //           let systemSoundID: SystemSoundID = 1016
        //             AudioServicesPlaySystemSound (systemSoundID)
        
        
        let alertcontroller = UIAlertController(title: "title", message: "werwer", preferredStyle: UIAlertControllerStyle.Alert)
        alertcontroller.accessibilityValue = "alertValue"
        alertcontroller.accessibilityHint = "hint"
        let cancelaction = UIAlertAction(title: "cancel", style: .Cancel, handler: nil)
        alertcontroller.addAction(cancelaction)
        self.presentViewController(alertcontroller, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

