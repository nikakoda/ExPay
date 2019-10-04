//
//  MyAccountVC.swift
//  ExPay
//
//  Created by Ника Перепелкина on 02/10/2019.
//  Copyright © 2019 Nika Perepelkina. All rights reserved.
//

import UIKit

class MyAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // спрятать кнопку "назад"
        self.navigationItem.setHidesBackButton(true, animated:true)
        
        
        
        let color1 = #colorLiteral(red: 0.06666666667, green: 0.2274509804, blue: 0.3725490196, alpha: 1).cgColor
              let color2 = #colorLiteral(red: 0.02352941176, green: 0.1019607843, blue: 0.1725490196, alpha: 1).cgColor
              
              let gradientLayer = CAGradientLayer()
              gradientLayer.frame = self.view.bounds
              gradientLayer.colors = [color1, color2]
              gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
              gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
              self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        
        view.endEditing(false)
    }
    
    
    // по факту активными сделать только врехнюю часть
    // просто вставить картинки вместо точек
    
    
    // для page controller
    // https://www.youtube.com/watch?v=AgUubgI-ZjI
    // вставить картинки вместо точек
    // http://qaru.site/questions/11550489/add-border-for-dots-in-uipagecontrol
    //https://stackoverflow.com/questions/12190147/customize-dot-with-image-of-uipagecontrol-at-index-0-of-uipagecontrol
    // https://stackoverflow.com/questions/51675303/uipagecontrol-and-uiscrollview-not-scrolling
    
    // поместить пэйдж контрол в юайимаге вью и пролистывать скроллить только это
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
