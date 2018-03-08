//
//  ViewController.swift
//  protocolosParaCompletar
//
//  Created by Yolanda Martinez on 2/22/18.
//  Copyright © 2018 com.itesm. All rights reserved.
//
//  Lorraine Bichara Assad A01193063

import UIKit

class ViewController: UIViewController {
    
    var apuntador : protocoloModificarCalif! //o de tipo table view controller
    //apunta a table view controller
    
    var objeto = Actividad(nombreAlum: "", calif: 0, coment: "")
    
    @IBOutlet weak var lbNombreAlumno: UILabel!
    @IBOutlet weak var lbCalificacion: UILabel!
    @IBOutlet weak var textViewComentarios: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Calificar"
        lbNombreAlumno.text = objeto.nombreAlum
        lbCalificacion.text = String(objeto.calif)
        textViewComentarios.text = objeto.coment
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calificar" {
            let vistaCalificar = segue.destination as! ViewControllerCalifica
            vistaCalificar.delegado = apuntador
        }
    }

}
