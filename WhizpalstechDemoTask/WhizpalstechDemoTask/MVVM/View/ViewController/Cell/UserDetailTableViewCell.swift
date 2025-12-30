//
//  UserDetailTableViewCell.swift
//  WhizpalstechDemoTask
//
//  Created by Jay Ghervada on 30/12/25.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var vwBase: UIView!
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblUserName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setUpUi()
    }
    
    
    private func setUpUi(){
        self.vwBase.layer.cornerRadius = 16
        self.vwBase.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configUserCell(_ user : UserDetailObject){
        self.lblName.text =     "👤 Name: \(user.name)"
        self.lblUserName.text = "🆔 User Name: \(user.username)"
        self.lblEmail.text =    "📧 Email: \(String(describing: user.email))"
    }
}
