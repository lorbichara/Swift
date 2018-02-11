//
//  ViewControllerPrisma.swift
//  CuerposGeométricos
//
//  Created by Lorraine Bichara Assad on 1/29/18.
//  Copyright © 2018 Lorraine Bichara Assad. All rights reserved.
//

import UIKit

class ViewControllerPrisma: UIViewController {
    @IBOutlet weak var imgFoto: UIImageView!
    
    @IBOutlet weak var tfLargo: UITextField!
    @IBOutlet weak var tfAncho: UITextField!
    @IBOutlet weak var tfAltura: UITextField!
    
    @IBOutlet weak var btCancelar: UIButton!
    @IBOutlet weak var btGuardar: UIButton!
    
    
    var largo : String!
    var ancho : String!
    var altura : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (sender as! UIButton) == btGuardar {
            let vistaInic = segue.destination as! ViewController
            vistaInic.ancho = tfAncho.text!
            vistaInic.altura = tfAltura.text!
            vistaInic.largo = tfLargo.text!
            vistaInic.imagen = imgFoto.image!
        
            if let anchoD = Double(tfAncho.text!), let alturaD = Double(tfAltura.text!), let largoD = Double(tfLargo.text!) {
                let volumen = anchoD * alturaD * largoD
                let volRedondo = round(100*volumen)/100
                vistaInic.volumen = String(volRedondo)
            }
        } else if (sender as! UIButton) == btCancelar {
            let vistaInic = segue.destination as! ViewController
            vistaInic.ancho = nil
            vistaInic.altura = nil
            vistaInic.largo = nil
            vistaInic.volumen = nil
            vistaInic.imagen = #imageLiteral(resourceName: "figuras")
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (sender as! UIButton) == btGuardar {
            if tfAltura.text! == "" || tfAncho.text! == "" || tfLargo.text! == "" {
                let alerta = UIAlertController(title: "Error", message: "Los campos deben tener datos", preferredStyle: .alert)
                alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                present(alerta, animated: true, completion: nil)
                return false
            }
        }
        return true
    }
}
