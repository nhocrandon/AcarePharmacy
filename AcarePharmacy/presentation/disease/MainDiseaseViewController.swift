//
//  MainDiseaseViewController.swift
//  AcarePharmacy
//
//  Created by Long Quách Phi on 1/25/18.
//  Copyright © 2018 Long Quách Phi. All rights reserved.
//

import UIKit
import CarbonKit

class MainDiseaseViewController: UIViewController {

    let items = ["item 1", "item 2", "item 3"]
    var carbonTabSwipeNavigation: CarbonTabSwipeNavigation = CarbonTabSwipeNavigation()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items as [AnyObject], delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)

        self.style()
        // Do any additional setup after loading the view.
    }

    func style()
    {
        let color = #colorLiteral(red: 0.4447643757, green: 0.708481729, blue: 0.8215033412, alpha: 1)
        let numberItem = CGFloat(items.count)
        let distantItem = UIScreen.main.bounds.size.width/numberItem
        /*
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.tintColor = UIColor.white
        self.navigationController!.navigationBar.barTintColor = color
        self.navigationController!.navigationBar.barStyle = .blackTranslucent*/
        //self.navigationController!.navigationBar.barTintColor = color
        carbonTabSwipeNavigation.toolbar.isTranslucent = false
        carbonTabSwipeNavigation.setIndicatorColor(color)
        carbonTabSwipeNavigation.setNormalColor(color, font: UIFont.boldSystemFont(ofSize: 14))
        for i in items{
            let index = items.index(of: i)
            carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(CGFloat(distantItem), forSegmentAt: index!)
        }
        carbonTabSwipeNavigation.setNormalColor(UIColor.black.withAlphaComponent(0.6))
        carbonTabSwipeNavigation.setSelectedColor(color, font: UIFont.boldSystemFont(ofSize: 14))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MainDiseaseViewController: CarbonTabSwipeNavigationDelegate{
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        switch index {
        case 0:
            return self.storyboard?.instantiateViewController(withIdentifier: "DetailDiseaseVC") as! DetailDiseaseViewController
        case 1:
            return self.storyboard?.instantiateViewController(withIdentifier: "DetailDiseaseVC") as! DetailDiseaseViewController
        case 2:
            return self.storyboard?.instantiateViewController(withIdentifier: "TabContainInDetailDiseaseVC") as! TabContainInDetailDiseaseViewController
        default:
           return self.storyboard?.instantiateViewController(withIdentifier: "DetailDiseaseVC") as! DetailDiseaseViewController
        }
        
    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, didMoveAt index: UInt) {
        NSLog("Did move at index: %ld", index)
    }
}
