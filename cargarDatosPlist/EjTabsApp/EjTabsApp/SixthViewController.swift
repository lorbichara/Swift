//
//  SixthViewController.swift
//  EjTabsApp
//
//  Created by alumno on 2/26/18.
//  Copyright © 2018 Tec. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {

    @IBOutlet weak var tfDatoLogin: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navControllerView = segue.destination as! UINavigationController
        let tableViewContr = navControllerView.topViewController as! FourthTableViewController
        
        tableViewContr.datoMostrar = tfDatoLogin.text
        
    }

}
