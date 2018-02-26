//
//  MenuSideViewController.swift
//  AcarePharmacy
//
//  Created by Long Quách Phi on 1/17/18.
//  Copyright © 2018 Long Quách Phi. All rights reserved.
//

import UIKit
import ExpandableCell

class MenuSideViewController: UIViewController {

    @IBOutlet weak var viewCoverUserInfo: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var tableViewMenu: ExpandableTableView!
    @IBOutlet weak var btnBack: UIBarButtonItem!
    
    @IBAction func btnBackAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    //var selectIndexPath: IndexPath!
    /*
    var sections = [
        Section(Image: #imageLiteral(resourceName: "menu_avatar"), Name: "cell 1", Item: ["expand cell1","expand2 cell1","expand3 cell1","expand4 cell1"], Expanded: false),
        Section(Image: #imageLiteral(resourceName: "btn_hamberger"), Name: "cell 2", Item: ["expand1 cell2","expand2 cell2","expand3 cell2","expand4 cell2"], Expanded: false),
        Section(Image: #imageLiteral(resourceName: "tabbar_home"), Name: "cell 3", Item: ["expand1 cell3","expand2 cell3","expand3 cell3","expand4 cell3"], Expanded: false)
    ]
    */
    
    var dataImage = [
        #imageLiteral(resourceName: "tabbar_home"),#imageLiteral(resourceName: "tabbar_game"),#imageLiteral(resourceName: "tabbar_question"),#imageLiteral(resourceName: "tabbar_checklist")
    ]
    var dataname = [
        "Home","Game","Question","List"
    ]
    
    var cell: UITableViewCell {
        return tableViewMenu.dequeueReusableCell(withIdentifier: MenuExpandedTableViewCell.ID)!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.view.backgroundColor = #colorLiteral(red: 0.4447643757, green: 0.708481729, blue: 0.8215033412, alpha: 1)
        self.viewCoverUserInfo.backgroundColor = #colorLiteral(red: 0.4447643757, green: 0.708481729, blue: 0.8215033412, alpha: 1)
        self.tabBarController?.tabBar.isHidden = true
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4447643757, green: 0.708481729, blue: 0.8215033412, alpha: 1)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationController?.navigationBar.isTranslucent = true
        
        
        //self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "navigation_back")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "navigation_back")
        self.navigationItem.backBarButtonItem?.title = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"ok", style: .plain, target: nil, action: nil)
        
        avatarImage.image = #imageLiteral(resourceName: "menu_avatar")
        avatarImage.layer.cornerRadius = avatarImage.layer.frame.width/2
        avatarImage.layer.masksToBounds = true
        
        
        tableViewMenu.expandableDelegate = self
        tableViewMenu.animation = .automatic
        
        tableViewMenu.register(UINib(nibName: "NormalCell", bundle: nil), forCellReuseIdentifier: MenuNormalTableViewCell.ID)
        tableViewMenu.register(UINib(nibName: "ExpandableCell", bundle: nil), forCellReuseIdentifier: MenuExpandableTableViewCell.ID)
        tableViewMenu.register(UINib(nibName: "ExpandedCell", bundle: nil), forCellReuseIdentifier: MenuExpandedTableViewCell.ID)
        
        /*
        selectIndexPath = IndexPath(row: -1, section: -1)
        let nib = UINib(nibName: "MenuHeaderViewCell", bundle: nil)
        tableViewMenu.register(nib, forCellReuseIdentifier: "expandMenuItemCell")
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    var dataMenuExpanded = [
        "Hô hấp","Tiêu hoá","Sức khoẻ sinh sản","Đau lưng","Chống mặt","Khác"
    ]
    
}

extension MenuSideViewController: ExpandableDelegate{
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]? {
            if indexPath.row == 0{
                var arrCell = [MenuExpandedTableViewCell]()
                for i in dataMenuExpanded{
                    let cell = tableViewMenu.dequeueReusableCell(withIdentifier: MenuExpandedTableViewCell.ID) as! MenuExpandedTableViewCell
                    cell.lblNameItem.text = i
                    arrCell.append(cell)
                }
                return arrCell
            }
        return nil
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightsForExpandedRowAt indexPath: IndexPath) -> [CGFloat]? {
        switch indexPath.row {
            case 0:
                return Array(repeating: 44, count: dataMenuExpanded.count)
            default:
                break
            }
        return nil
        
    }
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        return dataname.count
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectRowAt indexPath: IndexPath) {
        //        print("didSelectRow:\(indexPath)")
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectExpandedRowAt indexPath: IndexPath) {
        //        print("didSelectExpandedRowAt:\(indexPath)")
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCell: UITableViewCell, didSelectExpandedRowAt indexPath: IndexPath) {
        //if let cell = expandedCell as? MenuExpandedTableViewCell {
            //print("\(cell.titleLabel.text ?? "")")
        //}
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0,2:
                guard let cell = expandableTableView.dequeueReusableCell(withIdentifier: MenuExpandableTableViewCell.ID) else { return UITableViewCell() }
                return cell
                
            case 1, 4:
                guard let cell = expandableTableView.dequeueReusableCell(withIdentifier: MenuNormalTableViewCell.ID)  else { return UITableViewCell() }
                return cell
                
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0, 1, 2, 3, 4:
                guard let cell = expandableTableView.dequeueReusableCell(withIdentifier: MenuNormalTableViewCell.ID) else { return UITableViewCell() }
                
                return cell
                
            default:
                break
            }
        default:
            break
        }
        */
       let cell = expandableTableView.dequeueReusableCell(withIdentifier: MenuNormalTableViewCell.ID) as! MenuNormalTableViewCell
        cell.lblNameItem.text = dataname[indexPath.row]
        cell.imageItem.image = dataImage[indexPath.row]
        return cell
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //switch indexPath.section {
            /*
        case 0:
                return 90
        case 1:
            switch indexPath.row {
            case 0, 1, 2, 3, 4:
                return 80
                
            default:
                break
            }
        default:
            break
        }
        */
        return 80
    }
    
    func expandableTableView(_ expandableTableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = expandableTableView.cellForRow(at: indexPath)
        //cell?.contentView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        //cell?.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
    }
    
    func expandableTableView(_ expandableTableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
