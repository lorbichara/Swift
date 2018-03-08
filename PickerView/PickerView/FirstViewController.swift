//
//  FirstViewController.swift
//  PickerView
//
//  Created by Lorraine Bichara Assad on 3/2/18.
//  Copyright © 2018 Lorraine Bichara Assad. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var lbNumber: UILabel!
    @IBOutlet weak var lbLetter: UILabel!
    var numbers = [1, 2, 3, 4, 5, 6, 7]
    var letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l"]

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        lbNumber.text = String(numbers[0])
        lbLetter.text = letters[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - UIPickerViewDataSource methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return numbers.count
        }
        return letters.count
    }
    
    //MARK: - UIPickerViewDelegate methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return String(numbers[row])
        } else {
            return letters[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            lbNumber.text = String(numbers[row])
        } else {
            lbLetter.text = letters[row]
        }
    }
}
