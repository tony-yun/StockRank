//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by 윤태웅 on 9/28/23.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    
    func configure(_ stock:StockModel){
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: "\(stock.imageName)")
        companyName.text = "\(stock.name)"
        companyPriceLabel.text = "\(convertToCurrencyFormat(price: stock.price)) 원"
        
        // stock.diff가 0보다 클 시 빨간색, 작을 시 파란색. 
        // 내코드:
//        let stockDiffResult = stock.diff
//        if stockDiffResult >= 0 {
//            diffLabel.textColor = UIColor.red
//        } else {
//            diffLabel.textColor = UIColor.blue
//        }
        
        // 개선된 코드 (if문)
//        let color: UIColor
//        if stock.diff >= 0 {
//            color = UIColor.systemRed
//        } else {
//            color = UIColor.systemBlue
//        }
//        diffLabel.textColor = color
        
        // 삼항연산자
        diffLabel.textColor = stock.diff >= 0 ? UIColor.systemRed : UIColor.systemBlue
        
        diffLabel.text = "\(stock.diff)%"
    }
    
    // 가격을 숫자에서 콤마 들어간 숫자로 변화하기
    func convertToCurrencyFormat(price:Int)->String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter.string(from: NSNumber(value: price)) ?? ""
    }
}
