//
//  UserDetailViewController.swift
//  WhizpalstechDemoTask
//
//  Created by Jay Ghervada on 30/12/25.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblWebSite: UILabel!
    
    @IBOutlet weak var lblStreet: UILabel!
    @IBOutlet weak var lblSuite: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    
    @IBOutlet weak var lblZIpCode: UILabel!
    @IBOutlet weak var lblCompany: UILabel!
    
    var objUser: UserDetailObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    private func setUpUI(){
        self.lblName.text =     "👤 Name: \(objUser?.name ?? "")"
        self.lblUserName.text = "🆔 User Name: \(objUser?.username ?? "")"
         
        self.lblEmail.text =    "📧 Email: \(String(describing: objUser?.email ?? ""))"
        self.lblPhone.text =    "📞 Phone: \(String(describing: objUser?.phone ?? ""))"
        self.lblWebSite.text =  "🌐 Website: \(String(describing: objUser?.website ?? ""))"
        
        self.lblStreet.text =    "    🛣️ Street: \(String(describing: objUser?.address.street ?? ""))"
        self.lblSuite.text  =    "    🏢 Suite: \(String(describing: objUser?.address.suite ?? ""))"
        self.lblCity.text =      "    🌆 City: \(String(describing: objUser?.address.city ?? ""))"
        self.lblZIpCode.text =   "    📮 Zipcode: \(String(describing: objUser?.address.zipcode ?? ""))"
        
        self.lblCompany.text =        " 🏢 Company: \(String(describing: objUser?.company.name ?? ""))"
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
