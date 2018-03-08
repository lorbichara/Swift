//
//  SecondViewController.swift
//  PickerView
//
//  Created by Lorraine Bichara Assad on 3/2/18.
//  Copyright © 2018 Lorraine Bichara Assad. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var images = [#imageLiteral(resourceName: "cherry"), #imageLiteral(resourceName: "lemon"), #imageLiteral(resourceName: "apple"), #imageLiteral(resourceName: "bar"), #imageLiteral(resourceName: "crown"), #imageLiteral(resourceName: "seven")]
    let img = #imageLiteral(resourceName: "lemon")
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var imgView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        imgView.image = images[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - UIPickerViewDataSource methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    
    //MARK: - UIPickerViewDelegate methods
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 110, height: 60))
        let imageView = UIImageView(frame: CGRect(x: 20, y: 0, width: 64, height: 64))
        
        imageView.image = images[row]
        view.addSubview(imageView)
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imgView.image = images[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 80
    }
}
