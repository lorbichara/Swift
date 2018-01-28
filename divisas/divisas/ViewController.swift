//
//  ViewController.swift
//  divisas
//
//  Created by Lorraine Bichara on 1/11/18.
//  Copyright © 2018 All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfTipoCambio: UITextField!
    @IBOutlet weak var tfPesos: UITextField!
    @IBOutlet weak var tfDolares: UITextField!
    @IBOutlet weak var imagen: UIImageView!
    
    
    //se ejecuta cuando se acaba de cargar la aplicación
    //aquí se inicializan cosas
    override func viewDidLoad() {
        super.viewDidLoad()
        imagen.image = #imageLiteral(resourceName: "dollarSign")
        //UIImage(mandas la imagen)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(quitaTeclado))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calcularDolares(_ sender: UIButton) {
        if let tipoCambio = Double (tfTipoCambio.text!), let pesos = Double (tfPesos.text!) {
            let dolares = pesos / tipoCambio
            tfDolares.text = "\(dolares)"
        }
        
        //los parámetros de un método en swift tiene nombre
        else {
            let alerta = UIAlertController(title: "Error", message: "Los campos deben tener valor numérico", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alerta, animated: true, completion: nil)
            //(() -> Void, qué pasa cuando termina la alerta? nil
            
            tfDolares.text = ""
        }
    }
    
    @IBAction func quitaTeclado() {
        view.endEditing(true)
    }
}
