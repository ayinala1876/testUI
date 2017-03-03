//
//  testUIUITests.swift
//  testUIUITests
//
//  Created by admin on 2/16/17.
//  Copyright © 2017 admin. All rights reserved.
//

import XCTest
import AVFoundation


class sampleUItestUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    static func playBuzzSound() {
        /* dispatch_async(dispatch_get_main_queue(),{
         let systemSoundID: SystemSoundID = 1016
         AudioServicesPlaySystemSound (systemSoundID)
         }) */
        
        if let path = NSBundle(forClass: sampleUItestUITests.self).pathForResource("iphonenotification", ofType: "mp3") {
            let soundNotification = NSURL(fileURLWithPath: path)
            do{
                let audioPlayer = try AVAudioPlayer(contentsOfURL:soundNotification)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            }catch {
                print("Error getting the audio file")
            }
        }
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testLabel() {
        let app = XCUIApplication()
        let label = app.staticTexts["status"]
        if let value = label.value as? String {
            
        }
        
        let label2 = app.staticTexts["vandanam"]
        if let value2 = label.value as? String {
            
        }
    }
    func testEx() {
        
        let app = XCUIApplication()
        app.buttons["btn"].tap()
        
        sleep(2)
        let alert = app.alerts["title"]
        
        if alert.exists == true {
            if let value = alert.value as? String {
                
            }
        }
        
        if app.alerts["title"].exists {
            app.alerts["title"].buttons["cancel"].tap()
        }

        
        //  let systemSoundID: SystemSoundID = 1016
        //  AudioServicesPlaySystemSound (systemSoundID)
        
        
    }
    func testABCR() {
        let text = "byteridge"
        let app = XCUIApplication()
        var field : XCUIElement
        
        sleep(4)
        
        if app.textFields["MyField"].exists {
            field = app.textFields["MyField"]
            field.tap()
            field.enterForSearchField(text)
            
        }
        else if app.textFields["field"].exists {
            field = app.textFields["field"]
            field.tap()
            field.enterForSearchField(text)
            
        }
        
        if app.alerts["title"].exists {
            app.alerts["title"].buttons["cancel"].tap()
        }

        
        
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // create a sound ID, in this case its the tweet sound.
        //   let systemSoundID: SystemSoundID = 1016
        //     AudioServicesPlaySystemSound (systemSoundID)
        
        
        
        
        let app = XCUIApplication()
        app.buttons["btn"].tap()
        
        
        let alerts = app.alerts["hfg"]
       // self.waitIfElementMayAppear(alerts, timeout: 5)
        
        if alerts.exists == true {
            if app.alerts["title"].exists {
                app.alerts["title"].buttons["cancel"].tap()
            }

        }
        else {
          //  self.waitIfElementMayAppear(app.alerts["title"], timeout: 7)
            if app.alerts["title"].exists {
                app.alerts["title"].buttons["cancel"].tap()
            }
            
        }
        //  let alert2 = app.alerts["alertValue"]
        //    alert2.buttons["cancel"].tap()
        
        /*addUIInterruptionMonitorWithDescription("Location Dialog") { (alert) -> Bool in
         alert.buttons["Allow"].tap()
         return true
         } */
    }
    
}
class BaseTestCase: XCTestCase {
    func testASDf() {
        let app = XCUIApplication()
        app.buttons
    }
    func useful() {
        
        addUIInterruptionMonitorWithDescription("Location Dialog") { (alert) -> Bool in
            alert.buttons["Allow"].tap()
            return true
        }
        
        //   app.buttons["Find Games Nearby?"].tap()
        //   app.tap() // need to interact with the app for the handler to fire
        //    XCTAssert(app.staticTexts["Authorized"].exists)
        /*  XCUIApplication *app = [[XCUIApplication alloc] init];
         app.launchEnvironment = @{@"isUITest": @YES};
         [app launch];
         let isInTestMode = ProcessInfo.processInfo.environment["XCInjectBundleInto"] != nil */
        
        
        // import this
        
        
    }
    
    func waitForHittable(element: XCUIElement, timeout: NSTimeInterval = 70, file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "hittable == 1")
        expectationForPredicate(existsPredicate, evaluatedWithObject: element, handler: nil)
        
        waitForExpectationsWithTimeout(timeout) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after \(timeout) seconds."
                self.recordFailureWithDescription(message,
                                                  inFile: file, atLine: line, expected: true)
            }
        }
    }
}
extension XCUIElement {
    
    func enterForSearchField(text: String) -> Void {
        for eachChar in text.characters.enumerate() {
            self.typeText("\(eachChar.element)")
        }
    }
    
}

extension XCTestCase {
    
    func handleSystemAlert(app : XCUIApplication) {
        addUIInterruptionMonitorWithDescription("") { (alert) -> Bool in
            if alert.buttons["Allow"].exists {
                alert.buttons["Allow"].tap()
            }
            else if alert.buttons["OK"].exists {
                alert.buttons["OK"].tap()
            }
            return true
        }
        app.tap()
    }
    
    func waitForElementToAppear(element: XCUIElement, timeout: NSTimeInterval,  file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        
        expectationForPredicate(existsPredicate,
                                evaluatedWithObject: element, handler: nil)
        
        waitForExpectationsWithTimeout(timeout) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after \(timeout) seconds."
                self.recordFailureWithDescription(message, inFile: file, atLine: line, expected: true)
            }
        }
    }
    func waitIfElementMayAppear(element: XCUIElement, timeout: NSTimeInterval,  file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        
        expectationForPredicate(existsPredicate,
                                evaluatedWithObject: element, handler: nil)
        
        waitForExpectationsWithTimeout(timeout) { (error) -> Void in
        }
    }
}

