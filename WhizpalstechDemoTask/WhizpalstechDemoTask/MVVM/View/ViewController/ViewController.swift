//
//  ViewController.swift
//  WhizpalstechDemoTask
//
//  Created by Jay Ghervada on 30/12/25.
//

import UIKit

class ViewController: UIViewController {
    
    //TableView Outlate
    @IBOutlet weak var tblUserList: UITableView!
    
    let viewModel = UserDetailsViewModel()//View Model
    
    let refreshControl = UIRefreshControl()// Pull to refresh variable

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userListApi()
        self.registerCellAndDataSource()
    }
    
    // Register cell, assign protocol and delegate to tableview
    func registerCellAndDataSource() {
        
        self.tblUserList.delegate = self
        self.tblUserList.dataSource = self
        
        self.tblUserList.register(
            UINib(nibName: "UserDetailTableViewCell", bundle: nil),
            forCellReuseIdentifier: "UserDetailTableViewCell")
        
        refreshControl.addTarget(
            self,
            action: #selector(handleRefresh),
            for: .valueChanged
        )
        
        tblUserList.refreshControl = refreshControl // assign tableview to pull to refresh variable
    }
    
    //On Pull to refresh api call
    @objc func handleRefresh() {
        self.userListApi()
        refreshControl.endRefreshing()
    }
    
    //UserLlist Api Funcation
    func userListApi() {
        Task {
            await viewModel.fetchUserDetailModels()
            self.tblUserList.reloadData()
        }
    }
}

//Extenshion for Tablview
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
    -> Int
    {
        return self.viewModel.modelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
    -> UITableViewCell
    {
        let identifier = "UserDetailTableViewCell"
        
        if let cell: UserDetailTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: identifier) as? UserDetailTableViewCell
        {
            let obj = self.viewModel.modelList[indexPath.row]
            cell.configUserCell(obj)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(
        _ tableView: UITableView, didSelectRowAt indexPath: IndexPath
    ) {
        let selectedUser = self.viewModel.modelList[indexPath.row]
         
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         if let detailVC = storyboard.instantiateViewController(withIdentifier: "UserDetailViewController") as? UserDetailViewController {
             detailVC.objUser = selectedUser
             navigationController?.pushViewController(detailVC, animated: true)
         }
    }
}
