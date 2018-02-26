//
//  LibraryViewController.swift
//  AcarePharmacy
//
//  Created by Long Quách Phi on 1/25/18.
//  Copyright © 2018 Long Quách Phi. All rights reserved.
//

import UIKit
import SideMenu

class LibraryViewController: UIViewController {
    @IBOutlet weak var collectionViewDisease: UICollectionView!
    let arrNameData = [
        "Hô hấp","Tiêu hoá","Sức khoẻ sinh sản","Đau lưng","Chống mặt","Khác"
    ]
    let arrImageData = [
        #imageLiteral(resourceName: "HoHap"),#imageLiteral(resourceName: "TieuHoa"),#imageLiteral(resourceName: "SucKhoeSinhSan"),#imageLiteral(resourceName: "DauLung"),#imageLiteral(resourceName: "ChongMat"),#imageLiteral(resourceName: "khac")
    ]
    
    func addCenterBarIconLogo(logoImage: UIImage){
        let logoImageView = UIImageView.init(image: logoImage)
        logoImageView.frame = CGRect(x:0.0,y:0.0, width:120,height:40)
        logoImageView.contentMode = .scaleAspectFit
        /*
         let logoImageView = UIImageView.init(image: logoImage)
         logoImageView.frame = CGRect(x:0.0,y:0.0, width:150,height:40)
         logoImageView.contentMode = .scaleAspectFit
         */
        navigationItem.titleView = logoImageView
    }
    
    func addRightBarIconMenu(iconImage: UIImage) {
        let iconImageView = UIImageView.init(image: iconImage)
        
        let imageItem = UIBarButtonItem.init(image: iconImage, style: .plain, target: self, action: #selector(menuSiding))
        let widthConstraint = iconImageView.widthAnchor.constraint(equalToConstant: 50)
        let heightConstraint = iconImageView.heightAnchor.constraint(equalToConstant: 50)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
        navigationItem.rightBarButtonItem =  imageItem
    }
    
    @objc func menuSiding(){
        let sideMenuVC = storyboard!.instantiateViewController(withIdentifier: "menuSide") as? MenuSideViewController
        let menuRightNav = UISideMenuNavigationController(rootViewController: sideMenuVC!)
        SideMenuManager.default.menuRightNavigationController = menuRightNav
        SideMenuManager.default.menuShadowColor = #colorLiteral(red: 0.4447643757, green: 0.708481729, blue: 0.8215033412, alpha: 1)
        SideMenuManager.default.menuAnimationBackgroundColor = UIColor.clear
        SideMenuManager.default.menuWidth = self.view.frame.width
        
        SideMenuManager.default.menuAnimationPresentDuration = 1
        SideMenuManager.default.menuAnimationDismissDuration = 1
        present(SideMenuManager.default.menuRightNavigationController!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCenterBarIconLogo(logoImage: #imageLiteral(resourceName: "logo_acare"))
        addRightBarIconMenu(iconImage: #imageLiteral(resourceName: "btn_hamberger"))
        collectionViewDisease.register(UINib(nibName: "TACell", bundle: nil), forCellWithReuseIdentifier: TACollectionViewCell.ID)
        
        if let flowLayout = self.collectionViewDisease.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.minimumLineSpacing = 0
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension LibraryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImageData.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TACollectionViewCell.ID, for: indexPath) as! TACollectionViewCell
        cell.imageTA.image = arrImageData[indexPath.row]
        cell.lblTAName.text = arrNameData[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("0")
        case 1:
            print("1")
        case 2:
            print("2")
        case 3:
            print("3")
        case 4:
            print("4")
        case 5:
            print("5")
        default:
            print("default")
        }
        /*
        let nextScreen = storyboard?.instantiateViewController(withIdentifier: "diseaseVC") as! DiseaseViewController
        nextScreen.title = arrNameData[indexPath.row]
        self.navigationController?.pushViewController(nextScreen, animated: true)
        */
    }
    
    /*
     func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
     let screenWidth = UIScreen.main.bounds.size.width
     return CGSize(width: screenWidth, height: screenWidth);
     }*/
    
}
