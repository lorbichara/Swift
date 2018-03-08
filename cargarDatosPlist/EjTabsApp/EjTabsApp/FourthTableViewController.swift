//
//  FourthTableViewController.swift
//  EjTabsApp
//
//  Created by alumno on 2/26/18.
//  Copyright © 2018 Tec. All rights reserved.
//

import UIKit

class FourthTableViewController: UITableViewController {
    
    var lista = ["1", "2", "3", "4", "5"]
    var datoMostrar : String! //no se inicializa

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = lista[indexPath.row]

        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vista5 = segue.destination as! FifthViewController
        let selectedIndexPath = tableView.indexPathForSelectedRow!
        vista5.datoMostrar = lista[selectedIndexPath.row] + " -- " + datoMostrar
    }

    //puede ser en lugar de unwind
    @IBAction func regresarVistaAnterior(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
