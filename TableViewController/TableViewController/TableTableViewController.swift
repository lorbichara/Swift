//
//  TableTableViewController.swift
//  TableViewController
//
//  Created by alumno on 2/12/18.
//  Copyright © 2018 Tec. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController {
    
    
    
    
    //Obligatorios number of rows in section and cell for row
    //index path
    //
    
    //poner = crea el objeto
    //Crea un objeto de arreglo de tipo jugador vacío.
    var listaJugadores = [Jugador]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lista Jugadores"
        
        //append para agregarlos al arreglo de Jugadores
        var jugador = Jugador(nombre: "Lorraine", puntos: 2100, email: "lor@gmail.com")
        listaJugadores.append(jugador)
        jugador = Jugador(nombre: "María", puntos: 2200, email: "maria@gmail.com")
        listaJugadores.append(jugador)
        jugador = Jugador(nombre: "Karla", puntos: 1100, email: "karla@gmail.com")
        listaJugadores.append(jugador)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //ponerle que es una sección
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //regresar cantidad de renglones usando count
        return listaJugadores.count
    }

    
    //EN REUSE IDENTIFIER CAMBIARLE EL NOMBRE (donde dice "celda")
    //EN EL STORYBOARD seleccionar celda y en 4ta pestaña, cambiarle el nombre
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        celda.textLabel?.text = listaJugadores[indexPath.row].nombre
        celda.detailTextLabel?.text = "\(indexPath.row)"
        celda.imageView?.image = #imageLiteral(resourceName: "usuario")
        
        

        // Configure the cell...

        return celda
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let vistaDetalle = segue.destination as! ViewController
        let indice = tableView.indexPathForSelectedRow!
        vistaDetalle.objeto = listaJugadores[indice.row]
    }

}
