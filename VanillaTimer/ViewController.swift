//
//  ViewController.swift
//  VanillaTimer
//
//  Created by apple on 2017/10/22.
//  Copyright © 2017年 Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timeField: UITextField!
    var startButton: UIButton!
    var timer: Timer!
    var time: Float!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let width = view.frame.width
        let height = view.frame.height
        
        timeField = UITextField(frame: CGRect(x: 0, y: height / 2 - 150, width: width, height: 100))
        timeField.textAlignment = .center
        timeField.returnKeyType = .done
        timeField.delegate = self
        timeField.placeholder = "Countdown"
        timeField.keyboardType = .numbersAndPunctuation
        timeField.font = .systemFont(ofSize: 50)
        timeField.borderStyle = .line
        view.addSubview(timeField)
        
        startButton = UIButton(frame: CGRect(x: width / 2 - 100, y: height / 2 + 50, width: 200, height: 100))
        startButton.backgroundColor = .green
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.titleLabel?.font = .systemFont(ofSize: 50)
        startButton.addTarget(self, action: #selector(startCountdown), for: .touchUpInside)
        view.addSubview(startButton)
    }
    
    @objc func startCountdown() {
        timeField.isEnabled = false
        startButton.isEnabled = false
        startButton.backgroundColor = .red
        time = NSString(string: timeField.text!).floatValue
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc func countdown() {
        time = time - 0.001
        if (time <= 0) {
            stopCountdown()
        }
    }
    
    func stopCountdown() {
        timer.invalidate()
        startButton.isEnabled = true
        startButton.backgroundColor = .green
        timeField.isEnabled = true
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
