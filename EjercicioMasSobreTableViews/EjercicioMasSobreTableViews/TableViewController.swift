//
//  TableViewController.swift
//  EjercicioMasSobreTableViews
//
//  Created by alumno on 3/5/18.
//  Copyright © 2018 Tec. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    //Crear lista de empleados vacía
    var listaEmp = [Empleado]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem //cambiar right a left
        
        let emp1 = Empleado(nombre: "Nicole", sueldo: 19000, foto: #imageLiteral(resourceName: "user"), departamento: "Ventas")
        let emp2 = Empleado(nombre: "Jorge", sueldo: 12000, foto: #imageLiteral(resourceName: "user"), departamento: "Operaciones")
        let emp3 = Empleado(nombre: "Esteban", sueldo: 14999, foto: #imageLiteral(resourceName: "user"), departamento: "Mercadotecnia")
        let emp4 = Empleado(nombre: "Andrea", sueldo: 15000, foto: nil , departamento: "Tecnología")
        
        listaEmp += [emp1, emp2, emp3, emp4]
        
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.estimatedRowHeight = 130
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaEmp.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.lbNombre.text = listaEmp[indexPath.row].nombre
        cell.lbDepartamento.text = listaEmp[indexPath.row].departamento
        
        let sueldo = listaEmp[indexPath.row].sueldo as NSNumber
        let formateador = NumberFormatter()
        formateador.numberStyle = .currency
        cell.lbSueldo.text = formateador.string(from: sueldo)
        
        cell.foto.image = listaEmp[indexPath.row].foto
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.15, alpha: 0.1)
            //cell.backgroundColor = UIColor.white
        }
        
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            listaEmp.remove(at: indexPath.row) //Borrar la información del arreglo
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let temp = listaEmp[fromIndexPath.row]
        listaEmp[fromIndexPath.row] = listaEmp[to.row]
        listaEmp[to.row] = temp
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
