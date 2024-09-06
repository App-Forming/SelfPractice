//
//  DataTableViewCell.swift
//  SelfPractice
//
//  Created by Lingam on 03/09/24.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var backview: UIView!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var idlbl: UILabel!
    @IBOutlet weak var colorlbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backview.layer.cornerRadius = 5.0
        self.backview.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
