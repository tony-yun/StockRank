//
//  StockRankViewController.swift
//  StockRank
//
//  Created by 윤태웅 on 9/28/23.
//

import UIKit

class StockRankViewController: UIViewController {

    let stockList:[StockModel] = StockModel.list //[StockModel]타입의 데이터를 가져오고 StockModel.list를 가져온다.
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self의 뜻은 알려주는 것이StockRankViewController라는 것
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}
// data어떤 데이터, presentation어떻게 표현, layout어떻게 배치

// 어떤 데이터를 어떻게 가져오는지에 대하여
extension StockRankViewController: UICollectionViewDataSource{
    // collectionView에게 몇개의 셀이 필요한지.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // collectionView에서 재사용 가능한 cell을 가져온다. 구분자 이름 필요. 각 셀을 어떻게 표현할건지에 대하여.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
        }
        //StockRankCollectionViewCell 커스텀 셀 사용.
        
        let stock = stockList[indexPath.item]
        cell.configure(stock)
        return cell
    }
    
    
}

// 어떻게 배치
extension StockRankViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // width == collectionView
        // height == 80
        
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
