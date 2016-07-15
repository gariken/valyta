//
//  historyCell.swift
//  
//
//  Created by Александр on 15.07.16.
//
//

import UIKit

class historyCell: UITableViewCell {

    @IBOutlet weak var prodajaLabel: UILabel!
    @IBOutlet weak var pokupkaLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
