//
//  DataCollectionViewCell.swift
//  ExPay
//
//  Created by Ника Перепелкина on 05/10/2019.
//  Copyright © 2019 Nika Perepelkina. All rights reserved.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelMoney: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var money = "2500"
    
    lazy var moneyArr = ["\(money)", "\(money)", "\(money)", "\(money)", "\(money)"]
    lazy var valueArr = ["THB", "DRG", "BTC", "ETC", "ABC"]
    
    
    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
           labelMoney.text = moneyArr[0]
            labelValue.text = valueArr[0]
        case 1:
            labelMoney.text = moneyArr[1]
            labelValue.text = valueArr[1]
        case 2:
           labelMoney.text = moneyArr[2]
            labelValue.text = valueArr[2]
        case 3:
            labelMoney.text = moneyArr[3]
            labelValue.text = valueArr[3]
        case 4:
            labelMoney.text = moneyArr[4]
            labelValue.text = valueArr[4]
        default:
            print("Что-то пошло не так!")
        }
        
    }
    
    
    
}









