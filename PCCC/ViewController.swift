//
//  ViewController.swift
//  PCCC
//
//  Created by Quang Thai on 12/15/18.
//  Copyright © 2018 Quang Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let cellID = "GatewayCollectionViewCell"
    private let spacing: CGFloat = 16
    var listSensor = [Device]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initSampleData()
        configureCollectionView()
        configureNavigation()
    }
    func initSampleData() {
        var number = 0
        for i in 0..<16 {
             number = Int.random(in: 0 ..< 3)
            listSensor.append(Device(id: "C\(i+1)", status: number, name: "C\(i+1)"))
        }
    }
    func configureNavigation() {
        navigationItem.title = "Viettel IoT"
        let moreButton = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(moreButtonAction))
//        moreButton.tintColor = .white
        navigationItem.rightBarButtonItem = moreButton
    }
    func caltWitdh(sizeOfList: Int) -> CGFloat {
        var result: CGFloat = 0
        let screenSize = collectionView.bounds
        let itemHorizontal = ceil(sqrt(Double(sizeOfList)))
        result = CGFloat(Double(screenSize.width) / itemHorizontal)
        return result
    }
    func caltHeight(sizeOfList: Int) -> CGFloat {
        var result: CGFloat = 0
        let screenSize = collectionView.bounds
        let itemHorizontal = ceil(sqrt(Double(sizeOfList)))
        let itemVertical = ceil(Double(sizeOfList) / itemHorizontal)
        result = CGFloat(Double(screenSize.height) / itemVertical)
        return result
    }

    @objc func moreButtonAction() {
        
    }
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
    }
}
extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailDeviceViewController()
        vc.fillData(device: listSensor[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: caltWitdh(sizeOfList: listSensor.count), height: caltHeight(sizeOfList: listSensor.count))
    }
}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listSensor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? GatewayCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.fillData(device: listSensor[indexPath.row])
        return cell
    }
    
    
}
