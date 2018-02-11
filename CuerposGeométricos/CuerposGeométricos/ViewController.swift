//
//  ViewController.swift
//  CuerposGeométricos
//
//  Created by Lorraine Bichara Assad on 1/29/18.
//  Copyright © 2018 Lorraine Bichara Assad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgFoto: UIImageView!
    
    @IBOutlet weak var btInicio: UIButton!
    @IBOutlet weak var btEsfera: UIButton!
    @IBOutlet weak var btPrisma: UIButton!
    
    @IBOutlet weak var lbMedidas: UILabel!
    @IBOutlet weak var lbVolumen: UILabel!
    
    var radio : String!
    var ancho : String!
    var largo : String!
    var altura : String!
    var volumen : String!
    var imagen : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwindEsfera(unwindSegue: UIStoryboardSegue) {
        if radio != nil && volumen != nil {
            imgFoto.image = imagen!
            lbMedidas.text = "Radio = " + radio
            lbVolumen.text = "Volumen = " + String(volumen)
        }
        else {
            imgFoto.image = #imageLiteral(resourceName: "figuras")
            lbMedidas.text = nil
            lbVolumen.text = nil
        }
    }
    
    @IBAction func unwindPrisma(unwindSegue: UIStoryboardSegue) {
        if ancho != nil && largo != nil && altura != nil {
            imgFoto.image = imagen!
            lbMedidas.text = """
            Ancho = \(ancho!)
            Largo: = \(largo!)
            Altura = \(altura!)
            """
            lbVolumen.text = "Volumen = " + String(volumen)
        } else {
            imgFoto.image = #imageLiteral(resourceName: "figuras")
            lbMedidas.text = nil
            lbVolumen.text = nil
            
        }
    }
    
    @IBAction func btInicio(_ sender: UIButton) {
        imgFoto.image = #imageLiteral(resourceName: "figuras")
        lbMedidas.text = nil
        lbVolumen.text = nil
    }
}
