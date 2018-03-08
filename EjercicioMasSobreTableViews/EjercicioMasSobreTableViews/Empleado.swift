//
//  Empleado.swift
//  EjercicioMasSobreTableViews
//
//  Created by alumno on 3/5/18.
//  Copyright © 2018 Tec. All rights reserved.
//

import UIKit

class Empleado: NSObject {
    
    var nombre : String
    var sueldo : Float //No llevan signo de ! porque se están inicializando las variables
    var foto : UIImage?
    var departamento : String
    
    init(nombre: String, sueldo: Float, foto: UIImage?, departamento: String) {
        self.nombre = nombre
        self.sueldo = sueldo
        self.foto = foto
        self.departamento = departamento
    }
}
