//
//  ViewController.swift
//  calendar
//
//  Created by Lorraine Bichara on 1/22/18.
//  Copyright © 2018 All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segControl: UISegmentedControl!
    
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    
    var date = Date()
    let month = DateFormatter()
    let day = DateFormatter()
    let year = DateFormatter()
    let dayOfWeek = DateFormatter()
    let monthYear = DateFormatter()
    
    func displayDate() {
        if segControl.selectedSegmentIndex == 0 {
            lbl1.text = month.string(from: date)
            lbl2.text = day.string(from: date)
            lbl3.text = year.string(from: date)
        }
        else {
            lbl1.text = dayOfWeek.string(from: date)
            lbl2.text = day.string(from: date)
            lbl3.text = monthYear.string(from: date)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        month.dateFormat = "MMMM"
        day.dateFormat = "dd"
        year.dateFormat = "yyyy"
        dayOfWeek.dateFormat = "EEEE"
        monthYear.dateFormat = "MMM, yyyy"
        
        lbl1.text = month.string(from: date)
        lbl2.text = day.string(from: date)
        lbl3.text = year.string(from: date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func avDia(_ sender: UIButton) {
        date = date.addingTimeInterval(86400)
        displayDate()
    }
    
    @IBAction func avSemana(_ sender: UIButton) {
        date = date.addingTimeInterval(604800)
        displayDate()
    }
    
    @IBAction func reDia(_ sender: UIButton) {
        date = date.addingTimeInterval(-86400)
        displayDate()
    }
    
    @IBAction func reSemana(_ sender: UIButton) {
        date = date.addingTimeInterval(-604800)
        displayDate()
    }

    @IBAction func segControlAction(_ sender: Any) {
        displayDate()
    }
}
