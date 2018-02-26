//
//  TabContainInDetailDiseaseViewController.swift
//  AcarePharmacy
//
//  Created by Long Quách Phi on 1/25/18.
//  Copyright © 2018 Long Quách Phi. All rights reserved.
//

import UIKit
import CarbonKit

class TabContainInDetailDiseaseViewController: UIViewController {

    let items = ["item 1", "item 2", "item 3"]
    
    var carbonTabSwipeNavigation: CarbonTabSwipeNavigation = CarbonTabSwipeNavigation()
    override func viewDidLoad() {
        super.viewDidLoad()
        carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items as [AnyObject], delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
        // Do any additional setup after loading the view.
        self.style()
    }
    
    func style()
    {
        let color = #colorLiteral(red: 0.4447643757, green: 0.708481729, blue: 0.8215033412, alpha: 1)
        /*
         self.navigationController!.navigationBar.isTranslucent = false
         self.navigationController!.navigationBar.tintColor = UIColor.white
         self.navigationController!.navigationBar.barTintColor = color
         self.navigationController!.navigationBar.barStyle = .blackTranslucent*/
        //self.navigationController!.navigationBar.barTintColor = color
        carbonTabSwipeNavigation.toolbar.isTranslucent = false
        carbonTabSwipeNavigation.setIndicatorColor(color)
        carbonTabSwipeNavigation.setNormalColor(color, font: UIFont.boldSystemFont(ofSize: 14))
        carbonTabSwipeNavigation.setNormalColor(UIColor.black.withAlphaComponent(0.6))
        carbonTabSwipeNavigation.setSelectedColor(color, font: UIFont.boldSystemFont(ofSize: 14))
        
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

extension TabContainInDetailDiseaseViewController: CarbonTabSwipeNavigationDelegate{
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        switch index {
        case 0:
            return self.storyboard?.instantiateViewController(withIdentifier: "DetailDiseaseVC") as! DetailDiseaseViewController
        case 1:
            return self.storyboard?.instantiateViewController(withIdentifier: "DetailDiseaseVC") as! DetailDiseaseViewController
        case 2:
            return self.storyboard?.instantiateViewController(withIdentifier: "DetailDiseaseVC") as! DetailDiseaseViewController
        default:
            return self.storyboard?.instantiateViewController(withIdentifier: "DetailDiseaseVC") as! DetailDiseaseViewController
        }
        
    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, didMoveAt index: UInt) {
        NSLog("Did move at index: %ld", index)
    }
}
