//
//  ViewControllerCalifica.swift
//  protocolosParaCompletar
//
//  Created by alumno on 2/22/18.
//  Copyright © 2018 com.itesm. All rights reserved.
//
//  Lorraine Bichara Assad A01193063

//de table a view paso actividad y apuntador self, y eso lo paso a califica
import UIKit

protocol protocoloModificarCalif {
    func modifCalif(act : Actividad)
}

class ViewControllerCalifica: UIViewController {
    
    var delegado : protocoloModificarCalif!

    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfCalif: UITextField!
    @IBOutlet weak var tvComentario: UITextView!
    
    override func viewDidLoad() {
        title = "Modificar calificación"
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btModificar(_ sender: UIButton) {
        if let nom = tfNombre.text, let calificacion = Int(tfCalif.text!), let comment = tvComentario.text {
            let acti = Actividad(nombreAlum: nom, calif: calificacion, coment: comment)
            delegado.modifCalif(act: acti)
            
            navigationController?.popViewController(animated: true)
            navigationController?.popViewController(animated: true)
        }
    }
}
