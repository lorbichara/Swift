//
//  ViewController.swift
//  CalculaTriangulos
//
//  Created by Lorraine Bichara on 19/01/18.
//  Copyright © 2018 Lorraine Bichara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dimension1: UITextField!
    @IBOutlet weak var dimension2: UITextField!
    @IBOutlet weak var dimension3: UITextField!
    
    @IBOutlet weak var switchVar: UISwitch!
    @IBOutlet weak var functionButton: UIButton!
    @IBOutlet weak var imagen: UIImageView!
    
    @IBOutlet weak var resultado: UILabel!
    
    override func viewDidLoad() {
        imagen.image = #imageLiteral(resourceName: "default")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(quitaTeclado))
        view.addGestureRecognizer(tap)
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func oprimirBoton(_ sender: UIButton) {
        if let dim1 = Double(dimension1.text!), let dim2 = Double(dimension2.text!), let dim3 = Double(dimension3.text!) {
            if functionButton.currentTitle != nil {
                //identificar triángulo
                if functionButton.currentTitle == "Tipo de Triángulo" {
                    if dim1 == dim2 && dim2 == dim3 {
                        resultado.text = "Equilátero"
                        imagen.image = #imageLiteral(resourceName: "equilatero")
                    }
                    else if dim1 != dim2 && dim2 != dim3 && dim1 != dim3 {
                        resultado.text = "Escaleno"
                        imagen.image = #imageLiteral(resourceName: "escaleno")
                    }
                    else if (dim1 == dim2 && dim2 != dim3) || (dim2 == dim3 && dim2 != dim1) || (dim1 == dim3 && dim1 != dim2) {
                        resultado.text = "Isóceles"
                        imagen.image = #imageLiteral(resourceName: "isoceles")
                    }
                }
                else { //Calcular área
                    let s = (dim1 + dim2 + dim3) / 2
                    let area = sqrt(s * ((s-dim1) * (s-dim2) * (s-dim3)))
                    let areaStr = String(format: "%.2f", area)
                    
                    resultado.text = "El área es de = \(areaStr)"
                }
            }
        }
        else {
            let alerta = UIAlertController(title: "Error", message: "Los campos deben tener valor numérico", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alerta, animated: true, completion: nil)
        }
    }
    
    @IBAction func switchFunction(_ sender: Any) {
        if switchVar.isOn {
            resultado.text = " "
            functionButton.setTitle("Tipo de Triángulo", for: UIControlState.normal)
            imagen.image = #imageLiteral(resourceName: "default")
        }
        else {
            resultado.text = " "
           functionButton.setTitle("Calcular Área", for: UIControlState.normal)
            imagen.image = nil
        }
    }
    
    @IBAction func quitaTeclado() {
        view.endEditing(true)
    }

}
