//
//  ViewController.swift
//  Game_test
//
//  Created by Максим Чесников on 23.11.2019.
//  Copyright © 2019 Максим Чесников. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bm10: UIButton!
    @IBOutlet weak var usloviya10: UILabel!
    @IBOutlet weak var menu_10: UIView!
    @IBOutlet weak var up_10_b: UIButton!
    @IBOutlet weak var up_1: UIButton!
    @IBOutlet weak var Label_auto: UILabel!
    @IBOutlet weak var Label_Click: UILabel!
    @IBOutlet weak var Label_hand: UILabel!
    @IBOutlet weak var heart: UIImageView!
    @IBOutlet weak var bmexit: UIButton!
    
    @IBOutlet weak var l_up10: UILabel!
    @IBOutlet weak var up_10_red: UIButton!
    @IBOutlet weak var play_button: UIButton!
    @IBOutlet weak var Usloviya: UILabel!
    @IBOutlet weak var bm: UIButton!
    @IBOutlet weak var menu_view: UIView!
    var marc_click = 0.0;
    var flag_click = 0;
    var up_money = 0.0;
    var k_up = 1.0;
    var origin_up1 = 1.0;
    var origin_price1 = 5.0;
    var k_up10 = 1.0;
    var origin_up10 = 100.0;
    var flag10 = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let name = defaults.string(forKey: "money"), let name1 = defaults.string(forKey: "upmoney")
        {
            marc_click = Double(name) ?? 0.0
            up_money = Double(name1) ?? 0.0
            // Will output "theGreatestName"
        }
        var timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        menu_view.center.y  += view.bounds.height
        menu_10.center.y  += view.bounds.height
        Usloviya.text = "-\(String(Int(origin_price1))) + \(String(Int(origin_up1)))"
        play_button.alpha = 0.0
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func Click(_ sender: Any) {
        marc_click += 1.0
        flag_click += 1
        Label_hand.text = String(flag_click)
    }
    @IBAction func Up_1(_ sender: Any) {
        Usloviya.text = "-\(String(format: "%.1f",(origin_price1))) + \(String(format: "%.1f",(origin_up1)))"
        if marc_click >= origin_price1
        {
            marc_click -= origin_price1
            up_money += origin_up1
            k_up *= 1.01
            origin_up1 = origin_up1 * k_up
            origin_price1 = origin_price1 * k_up
            Label_Click.text = String(Int(marc_click))
            Usloviya.text = "-\(String(format: "%.1f",(origin_price1))) + \(String(format: "%.1f",(origin_up1)))"
            if self.heart.alpha != 1.0
            {
                UIView.animate(withDuration: 2.5, delay: 0.5, options: .curveEaseInOut, animations: {
                self.heart.alpha = 1.0
                    }) { _ in print("Animation Done")
            }
            
        }
        }
        else
        {
            let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpEr") as! Message_View // 1
            
            self.addChild(popUpVC) // 2
            popUpVC.view.frame = self.view.frame  // 3
            self.view.addSubview(popUpVC.view) // 4
            popUpVC.didMove(toParent: self) // 5
        }
    }
    

    @IBAction func Up_2(_ sender: Any) {
        if marc_click >= 10.0
        {
            marc_click -= 10.0
            up_money += 2.0
            Label_Click.text = String(Int(marc_click))
            
        }
        else
        {
            let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpEr") as! Message_View // 1
            
            self.addChild(popUpVC) // 2
            popUpVC.view.frame = self.view.frame  // 3
            self.view.addSubview(popUpVC.view) // 4
            popUpVC.didMove(toParent: self) // 5
        }
    }
    
    @IBAction func Up_5(_ sender: Any) {
        if marc_click >= 30.0
        {
            marc_click -= 30.0
            up_money += 5.0
            Label_Click.text = String(Int(marc_click))
            
        }
        else
        {
            let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpEr") as! Message_View // 1
            
            self.addChild(popUpVC) // 2
            popUpVC.view.frame = self.view.frame  // 3
            self.view.addSubview(popUpVC.view) // 4
            popUpVC.didMove(toParent: self) // 5
        }
    }
    
    @IBAction func Up_10(_ sender: Any) {
        if marc_click >= 100.0
        {
            marc_click -= 100.0
            up_money += 10.0
            Label_Click.text = String(Int(marc_click))
            
        }
        else
        {
            let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpEr") as! Message_View // 1
            
            self.addChild(popUpVC) // 2
            popUpVC.view.frame = self.view.frame  // 3
            self.view.addSubview(popUpVC.view) // 4
            popUpVC.didMove(toParent: self) // 5
        }
    }
    
    ///Timer Action
    
    @objc func timerAction() {
        marc_click += up_money/100.0
        Label_Click.text = String(Int(marc_click))
        Label_auto.text = String(Int(up_money))
        if marc_click>=1000
        {
            play_button.alpha = 1.0;
        }
        let defaults = UserDefaults.standard
        defaults.set("\(String(marc_click))", forKey: "money")
        defaults.set("\(String(up_money))", forKey: "upmoney")
    }
    
    
    
    
    @IBAction func Upside_menu(_ sender: Any) {
//        if self.menu_view.alpha != 1.0
//        {
//            UIView.animate(withDuration: 1.5, delay: 0.5, options: .curveEaseInOut, animations: {
//            self.menu_view.alpha = 1.0
//            }) { _ in print("Animation Done")}
//
//
//        }
        UIView.animate(withDuration: 0.5, animations: {
          self.menu_view.center.y -= self.view.bounds.height
            self.bm.alpha = 0.0
            self.bmexit.alpha = 1.0
        })
        }
    
    @IBAction func Downside_menu(_ sender: Any) {
//        if self.menu_view.alpha != 0.0
//        {
//            UIView.animate(withDuration: 1.5, delay: 0.5, options: .curveEaseInOut, animations: {
//            self.menu_view.alpha = 0.0
//            }) { _ in print("Animation Done")}
//
//
//        }
        UIView.animate(withDuration: 0.5, animations: {
          self.menu_view.center.y += self.view.bounds.height
            self.bmexit.alpha = 0.0
            self.bm.alpha = 1.0
        })
    }
    var flag1 = 0;
    @IBAction func Book(_ sender: Any) {
        if self.flag10 == 1
        {
            UIView.animate(withDuration: 0.5, animations: {
              self.menu_10.center.y += self.view.bounds.height
              self.flag10 = 0;
            })
        }
        if self.bmexit.alpha == 0.0
        {
            
            UIView.animate(withDuration: 0.5, animations: {
              self.menu_view.center.y += self.view.bounds.height
                self.bmexit.alpha = 0.0
                self.up_1.alpha = 1.0
                self.bm.alpha = 1.0
                self.flag1 = 0;
            })
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations: {
              self.menu_view.center.y -= self.view.bounds.height
                self.bm.alpha = 0.0
                self.bmexit.alpha = 1.0
                self.flag1 = 1;
            })
        }
    }
    var origin_price10 = 50000.0;
    @IBAction func up10red(_ sender: Any) {
        usloviya10.text = "10 -\(String(format: "%.1f",(origin_price10))) + \(String(format: "%.1f",(origin_up10)))"
            if marc_click >= origin_price10
            {
                marc_click -= origin_price10
                up_money += origin_up10
                k_up10 *= 1.5
                origin_up10 = origin_up10 * k_up10
                origin_price10 = origin_price10 * k_up10
                Label_Click.text = String(Int(marc_click))
                usloviya10.text = "10 -\(String(format: "%.1f",(origin_price10))) + \(String(format: "%.1f",(origin_up10)))"
                
            }
        else
        {
            let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpEr") as! Message_View // 1
            
            self.addChild(popUpVC) // 2
            popUpVC.view.frame = self.view.frame  // 3
            self.view.addSubview(popUpVC.view) // 4
            popUpVC.didMove(toParent: self) // 5
        }
        }
    
    @IBAction func play_bt(_ sender: Any) {
        if self.flag1 == 1
        {
            UIView.animate(withDuration: 0.5, animations: {
              self.menu_view.center.y += self.view.bounds.height
                self.bm.alpha = 0.0
                self.bmexit.alpha = 1.0
                self.flag1 = 0;
            })
        }
            if self.bm10.alpha == 0.0
            {
                usloviya10.text = "10 -\(String(format: "%.1f",(origin_price10))) + \(String(format: "%.1f",(origin_up10)))"
                UIView.animate(withDuration: 0.5, animations: {
                  self.menu_10.center.y += self.view.bounds.height
                    self.bm10.alpha = 0.0
                    
                })
                self.flag10 = 0
            }
            else
            {
                UIView.animate(withDuration: 0.5, animations: {
                  self.menu_10.center.y -= self.view.bounds.height
                    self.bm10.alpha = 1.0

                })
                self.flag10 = 1
            }
        
        
    }
    
    @IBAction func bm10a(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
          self.menu_10.center.y += self.view.bounds.height
            self.bmexit.alpha = 0.0
            self.bm.alpha = 1.0
        })
    }
    //let shapeLayer = CAShapeLayer()
    
//    shapeLayer.strokeStart = 0.0
//    shapeLayer.strokeEnd = 0.0
//
//    let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
//    strokeEndAnimation.toValue = 1.0
//    strokeEndAnimation.duration = 0.75
//    strokeEndAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//    strokeEndAnimation.repeatCount = .greatestFiniteMagnitude
//
//    shapeLayer.add(strokeEndAnimation, forKey: "strokeEndAnimation")
    
}

