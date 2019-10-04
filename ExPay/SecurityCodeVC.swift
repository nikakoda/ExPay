//
//  SecurityCodeVC.swift
//  ExPay
//
//  Created by Ника Перепелкина on 02/10/2019.
//  Copyright © 2019 Nika Perepelkina. All rights reserved.
//

import UIKit

class SecurityCodeVC: UIViewController {
    
        @IBOutlet weak var passcodeView: SimplePasscodeView!
    
    @IBOutlet weak var applyPassCodeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let color1 = #colorLiteral(red: 0.06666666667, green: 0.2274509804, blue: 0.3725490196, alpha: 1).cgColor
       let color2 = #colorLiteral(red: 0.02352941176, green: 0.1019607843, blue: 0.1725490196, alpha: 1).cgColor
      
       let gradientLayer = CAGradientLayer()
       gradientLayer.frame = self.view.bounds
       gradientLayer.colors = [color1, color2]
       gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
       gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
       self.view.layer.insertSublayer(gradientLayer, at: 0)
     
        
        passcodeView.delegate = self
               
               passcodeView.isSecureEntry = true
               passcodeView.length = 4
               passcodeView.keyboardType = .numberPad
       // passcodeView.keyboardAppearance = .dark
    
               
               passcodeView.pinborderColor = #colorLiteral(red: 0, green: 0.6, blue: 1, alpha: 1).cgColor
        passcodeView.pinfillColor = #colorLiteral(red: 0.02352941176, green: 0.3843137255, blue: 0.6392156863, alpha: 1)
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
   
    
    
    
    
    
    
    
    
////////////  @IBAction func applyPassCodeButtonPressed(_ sender: UIButton) {
////////////   let pinnn = SimplePasscodeView(coder: NSCoder.Type)
////////////
////////////   if (pinnn?.hasText == true) {
////////////
////////////          performSegue(withIdentifier: "toMyAccountSegue", sender: nil)
////////////      } else {
////////////          let alert = UIAlertController(title: "Wrong format", message: "Please enter your access code!", preferredStyle: .alert)
////////////          let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
////////////          alert.addAction(okAction)
////////////          present(alert, animated: true, completion: nil)
////////////      }
////////////  }
    
}



/////////

// ввод или удаление пароля
extension SecurityCodeVC: SimplePasscodeDelegate {
   
    
    func didDeleteBackward() {
        //
    }
    
    func didFinishEntering(_ passcode: String) {
           print("Passcode: \(passcode)")
       }
    
    func didFinishEntering(_ passcode: String) -> Bool {
        print("Passcode: \(passcode)")
        return true
    }
        
        
      // //Do whatever you want
      // print("passcode: \(passcode)")
      // let alert = UIAlertController(title: "Passcode", message: passcode, preferredStyle: .alert)
      // let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
      // alert.addAction(alertAction)
      // present(alert, animated: true, completion: nil)
    }

