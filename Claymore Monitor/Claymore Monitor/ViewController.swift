//
//  ViewController.swift
//  Claymore Monitor
//
//  Created by Gary on 2017/10/10.
//  Copyright © 2017年 Gary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let button = UIButton() //frame: CGRect(x: 100, y: 100, width: 100, height: 50)
    let ipTextField = UITextField() //frame: CGRect(x: 100, y: 100, width: 100, height: 50)
    let runningTimeText = UITextView()
    let mhStatusText = UITextView()
    let gputempText = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let blcolor = UIColor(red:0.29, green:0.56, blue:0.89, alpha:1.00)
        
        // button
        button.setTitleColor(UIColor.gray, for: UIControlState.highlighted)
        button.setTitleColor(UIColor.white, for: .selected)
        button.backgroundColor = blcolor
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = blcolor.cgColor
        button.clipsToBounds = true
        button.setTitle("Reload", for: UIControlState.normal)
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        // textfield
        ipTextField.layer.cornerRadius = 5
        ipTextField.layer.borderWidth = 1
        ipTextField.layer.borderColor = blcolor.cgColor
        
        ipTextField.text = "0.0.0.0:3333"
        
        // runningTimeText
        runningTimeText.textColor = UIColor.black
        runningTimeText.text = "-- Hours, -- Minutes"
        runningTimeText.textAlignment = .center
        runningTimeText.font = UIFont(name: (runningTimeText.font?.fontName)!, size: 18)
        runningTimeText.isEditable = false
        
        // mhStatusText
        mhStatusText.textColor = UIColor.black
        mhStatusText.text = "-- MH/s"
        mhStatusText.textAlignment = .center
        mhStatusText.font = UIFont(name: (mhStatusText.font?.fontName)!, size: 18)
        mhStatusText.isEditable = false
        
        // runningTimeText
        gputempText.textColor = UIColor.black
        gputempText.text = "-- °C / -- %"
        gputempText.textAlignment = .center
        gputempText.font = UIFont(name: (gputempText.font?.fontName)!, size: 18)
        gputempText.isEditable = false
        
        // autolayout
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(ipTextField)
        ipTextField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(runningTimeText)
        runningTimeText.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mhStatusText)
        mhStatusText.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(gputempText)
        gputempText.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.view.addConstraint(NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.4, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: button, attribute: .width, multiplier: 0.3, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: ipTextField, attribute: .bottom, multiplier: 1.0, constant: 20))
        
        self.view.addConstraint(NSLayoutConstraint(item: ipTextField, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.7, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: ipTextField, attribute: .height, relatedBy: .equal, toItem: button, attribute: .height, multiplier: 0.7, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: ipTextField, attribute: .centerX, relatedBy: .equal, toItem: button, attribute: .centerX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: ipTextField, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 60))
        
        
        self.view.addConstraint(NSLayoutConstraint(item: runningTimeText, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.5, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: runningTimeText, attribute: .height, relatedBy: .equal, toItem: button, attribute: .height, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: runningTimeText, attribute: .centerX, relatedBy: .equal, toItem: button, attribute: .centerX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: runningTimeText, attribute: .top, relatedBy: .equal, toItem: button, attribute: .bottom, multiplier: 1.0, constant: 100))
        
        self.view.addConstraint(NSLayoutConstraint(item: mhStatusText, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.5, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: mhStatusText, attribute: .height, relatedBy: .equal, toItem: button, attribute: .height, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: mhStatusText, attribute: .centerX, relatedBy: .equal, toItem: button, attribute: .centerX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: mhStatusText, attribute: .top, relatedBy: .equal, toItem: runningTimeText, attribute: .bottom, multiplier: 1.0, constant: 20))
        
        self.view.addConstraint(NSLayoutConstraint(item: gputempText, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.5, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: gputempText, attribute: .height, relatedBy: .equal, toItem: button, attribute: .height, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: gputempText, attribute: .centerX, relatedBy: .equal, toItem: button, attribute: .centerX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: gputempText, attribute: .top, relatedBy: .equal, toItem: mhStatusText, attribute: .bottom, multiplier: 1.0, constant: 20))
    }
    
    @objc func buttonAction(sender: UIButton!) {
        
        let ipAddress = ipTextField.text
        
        let serverURLStr = "http://" + ipAddress!
        let serverURL = NSURL(string: serverURLStr);
        
        let request = NSMutableURLRequest(url:serverURL! as URL);
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("error=\(String(describing: error))")
                return
            }
            
            // Print out response string
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            // print("\(String(describing: responseString))")
            
            let regexp = "\\{\"result\": \\[.*\\]\\}"
            
            if let range = responseString?.range(of:regexp, options: .regularExpression) {
                let resultJSON = responseString?.substring(with:range)
                print(resultJSON!)
                
                let resultList : NSArray = self.convertToDictionary(text:resultJSON!)!["result"] as! NSArray
                print (resultList[0])
                
                // caculate duration time
                let durationTime = Int(String(describing: resultList[1]))!*60
                let (h,m,_) = self.secondsToHoursMinutesSeconds(seconds: durationTime)
                
                // caculate temperature
                // mhStatusText
                let mhtext = Double(String(describing: resultList[3]))! / 1000
                
                
                // caculate temperature
                // gputempText
                let temptext = String(describing: resultList[6])
                let temptextArr : [String] = temptext.components(separatedBy: ";")
                let temper : String = temptextArr[0]
                let percent : String = temptextArr[1]
                
                DispatchQueue.main.async {
                    self.runningTimeText.text = ("\(h) Hours, \(m) Minutes")
                    self.mhStatusText.text = ("\(mhtext) MH/S")
                    self.gputempText.text = ("\(temper)°C / \(percent)%")
                    
                }
                
            }
            
            
            
        }
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    // convert json string to dict or array
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
}




