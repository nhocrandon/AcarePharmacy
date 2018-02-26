//
//  ReproductiveHealthViewController.swift
//  AcarePharmacy
//
//  Created by Long Quách Phi on 1/25/18.
//  Copyright © 2018 Long Quách Phi. All rights reserved.
//

import UIKit
import YNExpandableCell

class ReproductiveHealthViewController: UIViewController {

    @IBOutlet weak var tableViewReproductive: YNTableView!
    
    let arrData = [
        "bệnh 1","bệnh 2","bệnh 3","bệnh 4","bệnh 5","bệnh 6"
    ]
    let arrDataEx = [
        "ex 1","ex 2","ex 3","ex 4","ex 5","ex 6"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewReproductive.register(UINib(nibName: "ReproductiveHealthTableViewCell", bundle: nil), forCellReuseIdentifier: ReproductiveHealthTableViewCell.ID)
        self.tableViewReproductive.ynDelegate = self
        self.tableViewReproductive.ynTableViewRowAnimation = .top
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ReproductiveHealthViewController: YNTableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let expandableCell = tableView.dequeueReusableCell(withIdentifier: ReproductiveHealthTableViewCell.ID) as! ReproductiveHealthTableViewCell
        
        
        return expandableCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    
}
