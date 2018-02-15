//
//  ViewController.swift
//  TableViewController
//
//  Created by alumno on 2/12/18.
//  Copyright © 2018 Tec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var objeto = Jugador()

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    
    //index path for selected row
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalle Jugador"
        lbl1.text = objeto.nombre
        lbl2.text = String(objeto.puntos)
        lbl3.text = objeto.email
        imagen.image = #imageLiteral(resourceName: "usuario")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

