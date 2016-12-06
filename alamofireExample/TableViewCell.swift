//
//  TableViewCell.swift
//  alamofireExample
//
//  Created by Aluno on 05/12/16.
//  Copyright © 2016 4tap. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myCell: UIView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myLoad: UIActivityIndicatorView!
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
