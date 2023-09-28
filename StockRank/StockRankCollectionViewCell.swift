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
