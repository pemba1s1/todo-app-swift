//
//  TableViewCell.swift
//  psherpa5121_lab6
//
//  Created by user237120 on 2/18/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBOutlet weak var todoTitle: UILabel!
}
