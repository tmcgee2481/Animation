//
//  ViewController.swift
//  Animation
//
//  Created by Syngenta RDIS Mac on 5/12/17.
//  Copyright © 2017 Syngenta GenEx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBAction func fadeIn(_ sender: Any) {
        
        image.alpha = 0
        
        UIView.animate(withDuration: 1, animations: {
            
            self.image.alpha = 1
        })
        
    }
    
    
    @IBAction func slideIn(_ sender: Any) {
        
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        
        UIView.animate(withDuration: 2, animations: {
            
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        })
        
    }
    
    
    @IBAction func grow(_ sender: Any) {
        
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1, animations: {
            
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        })
        
    }
    
    
    @IBOutlet weak var button: UIButton!

    @IBOutlet weak var image: UIImageView!
    
    var counter = 1
    var isAnimating = false
    
    var timer = Timer()
    
    func animate() {
        
        image.image = UIImage(named: "frame_\(counter)_delay-0.07s.gif")
        
        counter += 1
        
        if counter == 32 {
            
            counter = 0
        }
    }
    
    @IBAction func next(_ sender: Any) {
        
        if isAnimating {
            
            timer.invalidate()
            
            button.setTitle("Start Animation", for: [])
            
            isAnimating = false
            
        } else {
        
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            
            button.setTitle("Stop Animation", for: [])
            
            isAnimating = true
        
            
        }
        
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

