//
//  ViewController.swift
//  Mastermind
//
//  Created by Lorraine Bichara Assad on 1/31/18.
//  Copyright © 2018 Lorraine Bichara Assad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segJugProb: UISegmentedControl!
    
    //Botones que el usuario cambia
    @IBOutlet weak var bt1: UIButton!
    @IBOutlet weak var bt2: UIButton!
    @IBOutlet weak var bt3: UIButton!
    @IBOutlet weak var bt4: UIButton!
    
    //Las pistas
    @IBOutlet weak var vwsol1: UIView!
    @IBOutlet weak var vwsol2: UIView!
    @IBOutlet weak var vwsol3: UIView!
    @IBOutlet weak var vwsol4: UIView!
    
    //La solución
    @IBOutlet weak var vwSolucion: UIView!
    @IBOutlet weak var vwresp1: UIView!
    @IBOutlet weak var vwresp2: UIView!
    @IBOutlet weak var vwresp3: UIView!
    @IBOutlet weak var vwresp4: UIView!
    
    var color1 = 0
    var color2 = 0
    var color3 = 0
    var color4 = 0
    
    var numIntentos = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vwSolucion.isHidden = true
        bt1.backgroundColor = UIColor.yellow
        bt2.backgroundColor = UIColor.yellow
        bt3.backgroundColor = UIColor.yellow
        bt4.backgroundColor = UIColor.yellow
        
        vwresp1.backgroundColor = UIColor.purple
        vwresp2.backgroundColor = UIColor.purple
        vwresp3.backgroundColor = UIColor.purple
        vwresp4.backgroundColor = UIColor.purple
        
        numIntentos = 0
        color1=0
        color2=0
        color3=0
        color4=0
    }
    
    //Cambia el color de cada botón al dar click.
    func cambiarColor(bt: UIButton, clr: inout Int) {
        if clr == 0 {
            bt.backgroundColor = UIColor.blue
            clr = clr + 1
        } else if clr == 1 {
            bt.backgroundColor = UIColor.red
            clr = clr + 1
        } else if clr == 2 {
            bt.backgroundColor = UIColor.magenta
            clr = clr + 1
        } else if clr == 3 {
            bt.backgroundColor = UIColor.yellow
            clr = clr + 1
        } else if clr == 4 {
            bt.backgroundColor = UIColor.purple
            clr = clr + 1
        } else if clr == 5 {
            bt.backgroundColor = UIColor.green
            clr = 0
        }
    }
    
    @IBAction func bt1(_ sender: UIButton) {
       cambiarColor(bt: bt1, clr: &color1)
    }
    
    @IBAction func bt2(_ sender: UIButton) {
        cambiarColor(bt: bt2, clr: &color2)
    }
    
    @IBAction func bt3(_ sender: UIButton) {
        cambiarColor(bt: bt3, clr: &color3)
    }
    
    @IBAction func bt4(_ sender: UIButton) {
        cambiarColor(bt: bt4, clr: &color4)
    }
    
    //Cambiar modo de juego en el segmented control
    @IBAction func cambiarModo(_ sender: Any) {
        if segJugProb.selectedSegmentIndex == 0 {
            vwSolucion.isHidden = true
        }
        else {
            vwSolucion.isHidden = false
            
        }
    }
    
    //Función del botón Iniciar
    @IBAction func btIniciar(_ sender: UIButton) {
        segJugProb.selectedSegmentIndex = 0
        vwSolucion.isHidden = true
        bt1.backgroundColor = UIColor.yellow
        bt2.backgroundColor = UIColor.yellow
        bt3.backgroundColor = UIColor.yellow
        bt4.backgroundColor = UIColor.yellow
        
        vwsol1.backgroundColor = UIColor.clear
        vwsol2.backgroundColor = UIColor.clear
        vwsol3.backgroundColor = UIColor.clear
        vwsol4.backgroundColor = UIColor.clear
        
        numIntentos = 0
        var colorArray = [UIColor.red, UIColor.green, UIColor.blue, UIColor.yellow, UIColor.purple, UIColor.magenta]
        
        var randomIndex = Int(arc4random_uniform(UInt32(colorArray.count)))
        let color1 = colorArray[randomIndex]
        colorArray.remove(at: randomIndex)
        vwresp1.backgroundColor = color1
        
        randomIndex = Int(arc4random_uniform(UInt32(colorArray.count)))
        let color2 = colorArray[randomIndex]
        colorArray.remove(at: randomIndex)
        vwresp2.backgroundColor = color2
        randomIndex = Int(arc4random_uniform(UInt32(colorArray.count)))
        
        let color3 = colorArray[randomIndex]
        colorArray.remove(at: randomIndex)
        vwresp3.backgroundColor = color3
        
        randomIndex = Int(arc4random_uniform(UInt32(colorArray.count)))
        let color4 = colorArray[randomIndex]
        colorArray.remove(at: randomIndex)
        vwresp4.backgroundColor = color4
    }
    
    //Función del botón Probar
    @IBAction func btProbar(_ sender: UIButton) {
        
        //Si hay un color repetido
        if bt1.backgroundColor == bt2.backgroundColor || bt2.backgroundColor == bt3.backgroundColor || bt3.backgroundColor == bt4.backgroundColor || bt1.backgroundColor == bt3.backgroundColor || bt1.backgroundColor == bt4.backgroundColor || bt2.backgroundColor == bt4.backgroundColor {
            let alerta = UIAlertController(title: "Cuidado", message: "No debe haber colores repetidos en el intento.", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alerta, animated: true, completion: nil)
            
        //Si todos los colores son iguales a la solución (ganador)
        } else if bt1.backgroundColor == vwresp1.backgroundColor && bt2.backgroundColor == vwresp2.backgroundColor && bt3.backgroundColor == vwresp3.backgroundColor && bt4.backgroundColor == vwresp4.backgroundColor {
            numIntentos = numIntentos + 1
            let alerta = UIAlertController(title: "¡Felicidades!", message: "Ganaste en \(numIntentos) intentos.", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alerta, animated: true, completion: nil)
       
        } else {
            vwsol1.backgroundColor = UIColor.clear
            vwsol2.backgroundColor = UIColor.clear
            vwsol3.backgroundColor = UIColor.clear
            vwsol4.backgroundColor = UIColor.clear
            numIntentos = numIntentos + 1
            revisar()
        }
        
    }
    
    //Comparar la respuesta del usuario vs la solución y mostrar pistas
    func revisar() {
        if vwresp1.backgroundColor == bt1.backgroundColor {
            vwsol4.backgroundColor = UIColor.red
        } else if bt1.backgroundColor == vwresp2.backgroundColor || bt1.backgroundColor == vwresp3.backgroundColor || bt1.backgroundColor == vwresp4.backgroundColor {
            vwsol4.backgroundColor = UIColor.white
        }

        if vwresp2.backgroundColor == bt2.backgroundColor {
            vwsol3.backgroundColor = UIColor.red
        } else if bt2.backgroundColor == vwresp1.backgroundColor || bt2.backgroundColor == vwresp3.backgroundColor || bt2.backgroundColor == vwresp4.backgroundColor {
            vwsol3.backgroundColor = UIColor.white
        }

        if vwresp3.backgroundColor == bt3.backgroundColor {
            vwsol1.backgroundColor = UIColor.red
        } else if bt3.backgroundColor == vwresp1.backgroundColor || bt3.backgroundColor == vwresp2.backgroundColor || bt3.backgroundColor == vwresp4.backgroundColor {
            vwsol1.backgroundColor = UIColor.white
        }

        if vwresp4.backgroundColor == bt4.backgroundColor {
            vwsol2.backgroundColor = UIColor.red
        } else if bt4.backgroundColor == vwresp1.backgroundColor || bt4.backgroundColor == vwresp2.backgroundColor || bt4.backgroundColor == vwresp3.backgroundColor {
            vwsol2.backgroundColor = UIColor.white
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
