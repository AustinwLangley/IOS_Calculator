//
//  ViewController.swift
//  Calculator
//
//  Created by AL on 7/28/15.
//  Copyright (c) 2015 Mob3. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var userEnteredInput = false
    var operation: String?
    var calculator = Calculator() //Creating a calculator instance
    var ButtonAudioURL1 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("lightsaber_01", ofType: "wav")!)
    var ButtonAudioURL2 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("vader", ofType: "wav")!)
    var ButtonAudioURL3 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("chewy_roar", ofType: "wav")!)
    var ButtonAudioURL4 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("R2D2", ofType: "wav")!)
    var ButtonAudioURL5 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("vader2", ofType: "wav")!)
    var ButtonAudioURL6 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("yoda", ofType: "wav")!)
    var ButtonAudioURL7 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("swtheme", ofType: "wav")!)

    var ButtonAudioPlayer1 = AVAudioPlayer()
    var ButtonAudioPlayer2 = AVAudioPlayer()
    var ButtonAudioPlayer3 = AVAudioPlayer()
    var ButtonAudioPlayer4 = AVAudioPlayer()
    var ButtonAudioPlayer5 = AVAudioPlayer()
    var ButtonAudioPlayer6 = AVAudioPlayer()
    var ButtonAudioPlayer7 = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //button border
        for button in calculatorButton {
            button.layer.borderWidth = 0.5
            button.layer.borderColor = UIColor.whiteColor().CGColor
        }
        
        ButtonAudioPlayer1 = AVAudioPlayer(contentsOfURL: ButtonAudioURL1, error: nil)
        ButtonAudioPlayer2 = AVAudioPlayer(contentsOfURL: ButtonAudioURL2, error: nil)
        ButtonAudioPlayer3 = AVAudioPlayer(contentsOfURL: ButtonAudioURL3, error: nil)
        ButtonAudioPlayer4 = AVAudioPlayer(contentsOfURL: ButtonAudioURL4, error: nil)
        ButtonAudioPlayer5 = AVAudioPlayer(contentsOfURL: ButtonAudioURL5, error: nil)
        ButtonAudioPlayer6 = AVAudioPlayer(contentsOfURL: ButtonAudioURL6, error: nil)
        ButtonAudioPlayer7 = AVAudioPlayer(contentsOfURL: ButtonAudioURL7, error: nil)
        
        //Starwars Main theme
        ButtonAudioPlayer7.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var calculatorButton: [UIButton]!
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBAction func digitPressed(sender: UIButton) {
        
        ButtonAudioPlayer1.stop()
        ButtonAudioPlayer1.currentTime = 0
        ButtonAudioPlayer1.play()
        
        let digit = sender.currentTitle!
        clearButton.setTitle("C", forState: .Normal)
        if userEnteredInput {
            display.text = display.text! + digit
            
        } else {
            display.text = digit
            userEnteredInput = true
        }
    }
    
    @IBAction func operation(sender: UIButton) {
        operation = sender.currentTitle!
        userEnteredInput = false
        calculator.insertIntoArray(display.text!)
        calculator.insertIntoArray(operation!)
        display.text = calculator.operationCounter(operation!)
        ButtonAudioPlayer4.stop()
        ButtonAudioPlayer4.currentTime = 0
        ButtonAudioPlayer4.play()
    }
    
    @IBAction func equals() {
        if userEnteredInput == true {
            userEnteredInput = false
            calculator.insertIntoArray(display.text!)
            display.text = calculator.performCalculation()
            calculator.resetCounters()
            ButtonAudioPlayer2.stop()
            ButtonAudioPlayer2.currentTime = 0
            ButtonAudioPlayer2.play()
        }
    }
    
    @IBAction func percent(sender: UIButton) {
         display.text = calculator.percentCalculation(display.text!)
        ButtonAudioPlayer6.stop()
        ButtonAudioPlayer6.currentTime = 0
        ButtonAudioPlayer6.play()
    }
    
    @IBAction func negative(sender: UIButton) {
        ButtonAudioPlayer5.stop()
        ButtonAudioPlayer5.currentTime = 0
        ButtonAudioPlayer5.play()
        display.text = calculator.negative(display.text!)
    }
    
    @IBAction func clear(sender: UIButton) {
        
        ButtonAudioPlayer3.stop()
        ButtonAudioPlayer3.currentTime = 0
        ButtonAudioPlayer3.play()
        
        if userEnteredInput == false {
            calculator.allClear()
            println("In Clear function. Input array is now: \(calculator.inputArray)")
        }
        display.text = "0"
        userEnteredInput = false
        sender.setTitle("AC", forState: .Normal)
    }
    
    //allow for upside down view
    override func supportedInterfaceOrientations() -> Int{
        return Int(UIInterfaceOrientationMask.All.rawValue)
    }
}

