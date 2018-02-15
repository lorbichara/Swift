//
//  Jugador.swift
//  TableViewController
//
//  Created by alumno on 2/12/18.
//  Copyright © 2018 Tec. All rights reserved.
//

import UIKit

class Jugador: NSObject {
    
    //Todos los atributos de las clases se deben inicializar
    var nombre : String = ""
    var puntos : Int = 0
    var email : String = ""
    
    //agregar un atributo más que sea foto, y en el constructor agregarla también y que en la lista cada quien muestre su propia foto
    
    //: es declarar variable, = es crear un objeto 
    
    //Constructores siempre son init
    init(nombre: String, puntos: Int, email: String) {
        //self es para diferenciar entre el atributo y el parámetro ya que tienen el mismo nombre.
        self.nombre = nombre
        self.puntos = puntos
        self.email = email
    }
    
    override init() {
        //self es para diferenciar entre el atributo y el parámetro ya que tienen el mismo nombre.
        self.nombre = ""
        self.puntos = 0
        self.email = ""
    }
    
    

}
