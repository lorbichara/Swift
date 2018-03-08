//
//  TableViewController.swift
//  protocolosParaCompletar
//
//  Created by alumno on 2/22/18.
//  Copyright © 2018 com.itesm. All rights reserved.
//
//  Lorraine Bichara Assad A01193063

import UIKit

class TableViewController: UITableViewController, protocoloModificarCalif {
    
    var listaActs = [Actividad]()
    var renglonActivo : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Alumnos"
        
        var act = Actividad(nombreAlum: "Lorraine Bichara", calif: 95, coment: "Dummy text solo para verificar la funcionalidad del scroll del Text View: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis iaculis quam eu justo mollis, a vestibulum ipsum fringilla. Cras sed interdum metus, id viverra turpis. Mauris convallis hendrerit hendrerit. Duis fringilla diam quis arcu maximus, id aliquam mi sollicitudin. Curabitur et tempor sem. Proin mollis tincidunt augue vel hendrerit. Aenean porttitor interdum erat, quis tempor eros ultricies at.")
        listaActs.append(act)
        act = Actividad(nombreAlum: "Gerardo Consuelos", calif: 100, coment: "Buen trabajo. Se hizo el diseño correctamente, y se incluyeron todos los puntos necesarios. El formato de entrega fue el solicitado. Se entrego a tiempo.")
        listaActs.append(act)
        act = Actividad(nombreAlum: "Magaly Martínez", calif: 97, coment: "Faltó incluir la fecha")
        listaActs.append(act)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaActs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        celda.textLabel?.text = listaActs[indexPath.row].nombreAlum
        celda.detailTextLabel?.text = "\(listaActs[indexPath.row].calif)"
        
        return celda
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostrar" {
            let vistaDetalle = segue.destination as! ViewController
            let indice = tableView.indexPathForSelectedRow!
            vistaDetalle.objeto = listaActs[indice.row]
            renglonActivo = indice.row
            vistaDetalle.apuntador = self //ahora pasar eso a la última vista
        }
    }
    
    func modifCalif(act: Actividad) {
        listaActs[renglonActivo] = act
        tableView.reloadData()
    }
}
