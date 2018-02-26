//
//  DiseaseViewController.swift
//  AcarePharmacy
//
//  Created by Long Quách Phi on 1/19/18.
//  Copyright © 2018 Long Quách Phi. All rights reserved.
//

import UIKit

class DiseaseViewController: UIViewController {
    @IBOutlet weak var gridDiseaseCollectionView: UICollectionView!
    let arrNameData = [
        "bệnh 1","bệnh 2","bệnh 3","bệnh 4","bệnh 5","bệnh 6"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gridDiseaseCollectionView.register(UINib(nibName: "DiseaseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: DiseaseCollectionViewCell.ID)
        
        if let flowLayout = self.gridDiseaseCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.minimumLineSpacing = 0
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    let arrImageData = [
        #imageLiteral(resourceName: "HoHap"),#imageLiteral(resourceName: "TieuHoa"),#imageLiteral(resourceName: "SucKhoeSinhSan"),#imageLiteral(resourceName: "DauLung"),#imageLiteral(resourceName: "ChongMat"),#imageLiteral(resourceName: "khac")
    ]

}

extension DiseaseViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImageData.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiseaseCollectionViewCell.ID, for: indexPath) as! DiseaseCollectionViewCell
        cell.imageDisease.image = arrImageData[indexPath.row]
        cell.lblDiseaseName.text = arrNameData[indexPath.row]
        //self.navigationController?.title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let MainDiseaseVC = storyboard?.instantiateViewController(withIdentifier: "MainDiseaseVC") as! MainDiseaseViewController
        MainDiseaseVC.title = arrNameData[indexPath.row]
        self.navigationController?.pushViewController(MainDiseaseVC, animated: true)
 
    }
}
