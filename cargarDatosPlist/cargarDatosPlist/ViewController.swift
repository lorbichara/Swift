//
//  ViewController.swift
//  cargarDatosPlist
//
//  Created by alumno on 3/1/18.
//  Copyright © 2018 Tec. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrDiccionarios : NSArray!

    @IBOutlet weak var lbTipo: UILabel!
    @IBOutlet weak var lbCapacidad: UILabel!
    @IBOutlet weak var lbPrecio: UILabel!
    @IBOutlet weak var imgFoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        arrDiccionarios = NSArray(contentsOfFile: path!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    //MARK: - Métodos de TableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDiccionarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let dic = arrDiccionarios[indexPath.row] as! NSDictionary
        
        cell.textLabel?.text = dic.object(forKey: "tipo") as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dic = arrDiccionarios[indexPath.row] as! NSDictionary

        lbTipo.text = dic.object(forKey: "tipo") as? String
        lbCapacidad.text = dic.object(forKey: "capacidad") as? String
        let precio = dic.object(forKey: "precio") as! NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        lbPrecio.text = formatter.string(from: precio)
        
        let sUrl = dic.object(forKey: "urlFoto") as? String
        let url = URL(string: sUrl!)
        let imgData = try? Data(contentsOf: url!)
        imgFoto.image = UIImage(data: imgData!)
        
    }
    
}

