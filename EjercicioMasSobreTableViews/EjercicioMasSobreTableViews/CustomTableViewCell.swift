//
//  CustomTableViewCell.swift
//  EjercicioMasSobreTableViews
//
//  Created by alumno on 3/5/18.
//  Copyright © 2018 Tec. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var lbSueldo: UILabel!
    @IBOutlet weak var lbDepartamento: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
