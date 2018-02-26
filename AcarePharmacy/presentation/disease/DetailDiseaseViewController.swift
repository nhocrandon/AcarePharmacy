//
//  DetailDiseaseViewController.swift
//  AcarePharmacy
//
//  Created by Long Quách Phi on 1/25/18.
//  Copyright © 2018 Long Quách Phi. All rights reserved.
//

import UIKit

class DetailDiseaseViewController: UIViewController{

    @IBOutlet weak var webViewDetailDisease: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.google.com")
        let requestObj = URLRequest(url: url!)
        webViewDetailDisease.loadRequest(requestObj)
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
