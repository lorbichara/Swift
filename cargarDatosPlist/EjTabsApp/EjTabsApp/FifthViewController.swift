//
//  FifthViewController.swift
//  EjTabsApp
//
//  Created by alumno on 2/26/18.
//  Copyright © 2018 Tec. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    @IBOutlet weak var lbDatoAMostrar: UILabel!
    var datoMostrar : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbDatoAMostrar.text = datoMostrar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
