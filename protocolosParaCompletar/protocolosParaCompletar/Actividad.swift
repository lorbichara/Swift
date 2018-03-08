//
//  Actividad.swift
//  protocolosParaCompletar
//
//  Created by Yolanda Martinez on 2/22/18.
//  Copyright © 2018 com.itesm. All rights reserved.
//
//  Lorraine Bichara Assad A01193063

import UIKit

class Actividad: NSObject {

    var nombreAlum : String = ""
    var calif : Int = 0
    var coment : String = ""
    
    init(nombreAlum: String, calif: Int, coment: String) {
        self.nombreAlum = nombreAlum
        self.calif = calif
        self.coment = coment
    }
    
    init(nombreAlum: String) {
        self.nombreAlum = nombreAlum
        self.calif = 0
        self.coment = ""
    }
}
