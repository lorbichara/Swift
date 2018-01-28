//
//  ViewController.swift
//  UIView
//
//  Created by Lorraine Bichara on 1/15/18.
//  Copyright © 2018 All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var holaLabel: UILabel!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var sliderVar: UISlider!
    @IBOutlet weak var izqDerecha: UILabel!
    @IBOutlet weak var faceSlider: UILabel!
    @IBOutlet weak var switchVar: UISwitch!
    @IBOutlet weak var segControlVar: UISegmentedControl!
    
    @IBAction func sliderObj(_ sender: Any) {
        UIView.animate(withDuration: 1) { self.faceSlider.frame.origin.x = CGFloat(320 * self.sliderVar.value) }
        
    }
    
    @IBAction func holaSegControl(_ sender: Any) {
        if segControlVar.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 1) { self.holaLabel.frame.origin.x = 10 }
        } else { UIView.animate(withDuration: 1) { self.holaLabel.frame.origin.x = 250 }
            
        }
    }
    
    @IBAction func colorSwitch(_ sender: Any) {
        if switchVar.isOn {
            self.view3.backgroundColor = UIColor.yellow
        }
        else {
            self.view3.backgroundColor = UIColor.blue
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

