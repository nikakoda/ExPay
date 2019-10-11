//
//  SecurityCodeVC.swift
//  ExPay
//
//  Created by Ника Перепелкина on 02/10/2019.
//  Copyright © 2019 Nika Perepelkina. All rights reserved.
//

import UIKit

class SecurityCodeVC: UIViewController {
    
    var countOfPin = 1
    @IBOutlet weak var passcodeView: SimplePasscodeView!
    
    @IBOutlet weak var applyPassCodeButton: UIButton!
    
    
    @IBOutlet weak var createLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let color1 = #colorLiteral(red: 0.06666666667, green: 0.2274509804, blue: 0.3725490196, alpha: 1).cgColor
         let color2 = #colorLiteral(red: 0.02352941176, green: 0.1019607843, blue: 0.1725490196, alpha: 1).cgColor
         
         let gradientLayer = CAGradientLayer()
         gradientLayer.frame = self.view.bounds
         gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
         gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        
       
//        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.03529411765, green: 0.1254901961, blue: 0.2078431373, alpha: 1)
//        navigationController?.navigationBar.isTranslucent = false
        
        
        // внешний вид навигационной панели
        self.navigationController!.navigationBar.setBackgroundImage(#imageLiteral(resourceName: "Background"), for: .default)
        self.navigationController!.navigationBar.barTintColor = .white
        
        
        // изменение цвета строки состояния
        
        
        
        // появление клавиатуры при загрузке экрана
        view.endEditing(false)
        
        
        passcodeView.delegate = self
        
        passcodeView.isSecureEntry = true
        passcodeView.length = 4
        passcodeView.keyboardType = .numberPad
        passcodeView.keyboardAppearance = .dark
     
        
        
        passcodeView.pinborderColor = #colorLiteral(red: 0, green: 0.6, blue: 1, alpha: 1).cgColor
        passcodeView.pinfillColor = #colorLiteral(red: 0.02352941176, green: 0.3843137255, blue: 0.6392156863, alpha: 1)
        
        
        
        // внешний вид кнопки Apply
        applyPassCodeButton.backgroundColor = #colorLiteral(red: 0, green: 0.6, blue: 1, alpha: 1)
        applyPassCodeButton.tintColor = .white
        applyPassCodeButton.layer.cornerRadius = 25
        
       
        
//        let gradientLayer2 = CAGradientLayer()
//        gradientLayer2.frame = (self.navigationController?.navigationBar.bounds)!
//        gradientLayer2.colors = [color1, color2]
//        gradientLayer2.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradientLayer2.endPoint = CGPoint(x: 0.0, y: 0.0)
//        self.navigationController?.navigationBar.layer.insertSublayer(gradientLayer2, at: 0)
     
        
        
        createLabel.textColor = .white
        
        
    }
    
    

    
    
    
 
    
    
    
    
    
    
   // (coder: NSCoder.init())
    
    
    @IBAction func applyPassCodeButtonPressed(_ sender: UIButton) {
     //   let pinnn = SimplePasscodeView()
     //  // let tetet = PinView()
     //  // print(pinnn.passcodeText)
     //  // print("passcode: \(passcode)")
     //   print(pinnn.passcodeText)
     //   print(countOfPin)
        
        // pinnn.passcodeText.isEmpty == false
        if (countOfPin == 4) {
            
            performSegue(withIdentifier: "toMyAccountSegue", sender: nil)
        } else {
            let alert = UIAlertController(title: "Wrong format", message: "Please enter your access code", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
}



/////////


extension SecurityCodeVC: SimplePasscodeDelegate {
    
    // удаление пароля
    func didDeleteBackward() {
        countOfPin-=1
    }
    
    // полный ввод пароля
    func didFinishEntering(_ passcode: String) {
        print("Passcode: \(passcode)")
        countOfPin = passcode.count
    }
    
  
    
    // //Do whatever you want
    // print("passcode: \(passcode)")
    // let alert = UIAlertController(title: "Passcode", message: passcode, preferredStyle: .alert)
    // let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
    // alert.addAction(alertAction)
    // present(alert, animated: true, completion: nil)
}


