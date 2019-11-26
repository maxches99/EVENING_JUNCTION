//
//  game.swift
//  Game_test
//
//  Created by Максим Чесников on 24.11.2019.
//  Copyright © 2019 Максим Чесников. All rights reserved.

import UIKit

class GameController: UIViewController {
    
    
    @IBOutlet weak var score_fr: UIImageView!
    
    @IBOutlet weak var view_error: UIView!
    @IBOutlet weak var moneypersecond: UILabel!
    @IBOutlet weak var k_click: UILabel!
    @IBOutlet weak var Up_3bt: UIButton!
    @IBOutlet weak var Up_2bt: UIButton!
    @IBOutlet weak var levelhouse3: UILabel!
    @IBOutlet weak var levelhouse2: UILabel!
    @IBOutlet weak var levelhouse: UILabel!
    @IBOutlet weak var namehouse: UILabel!
    @IBOutlet weak var up_1bt: UIButton!
    @IBOutlet weak var money_label: UILabel!
    @IBOutlet weak var levelzd1: UILabel!
    @IBOutlet weak var usloviyazd1: UILabel!
    @IBOutlet weak var viewupzd1: UIView!
    @IBOutlet weak var zd11: UIImageView!
    @IBOutlet weak var zd9: UIImageView!
    @IBOutlet weak var zd8: UIImageView!
    @IBOutlet weak var zd7: UIImageView!
    @IBOutlet weak var zd6: UIImageView!
    @IBOutlet weak var zd5: UIImageView!
    @IBOutlet weak var zd4: UIImageView!
    @IBOutlet weak var zd3: UIImageView!
    @IBOutlet weak var zd2: UIImageView!
    @IBOutlet weak var zd1: UIImageView!
    @IBOutlet weak var btzd1: UIButton!
    var money_score = 0.0;
    var flag_click = 0.0;
    var levelzd1i = 0;
    var levelzd2i = 0;
    var levelzd3i = 0;
    var up_money = 0.0;
    var k_up = 2.0;
    var origin_up1 = 1.0;
    var origin_price1 = 5.0;
    var k_up2 = 2.0;
    var origin_up2 = 10.0;
    var origin_price2 = 1000.0;
    var k_up3 = 3.0;
    var origin_up3 = 50.0;
    var origin_price3 = 5000.0;
    var k_up10 = 1.0;
    var origin_up10 = 100.0;
    var flag10 = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let name = defaults.string(forKey: "money"), let name1 = defaults.string(forKey: "upmoney"), let name2 = defaults.string(forKey: "level1"), let name3 = defaults.string(forKey: "level2"), let name4 = defaults.string(forKey: "level3"), let name5 = defaults.string(forKey: "level1k"), let name6 = defaults.string(forKey: "level2k"), let name7 = defaults.string(forKey: "level3k"), let name8 = defaults.string(forKey: "levelorigin_price"), let name9 = defaults.string(forKey: "levelorigin_price2"), let name10 = defaults.string(forKey: "levelorigin_price3"), let name11 = defaults.string(forKey: "levelorigin_up"), let name12 = defaults.string(forKey: "levelorigin_up2"), let name13 = defaults.string(forKey: "levelorigin_up3")
        {
            money_score = Double(name) ?? 0.0
            up_money = Double(name1) ?? 0.0
            levelzd1i = Int(name2) ?? 0
            levelzd2i = Int(name3) ?? 0
            levelzd3i = Int(name4) ?? 0
            k_up = Double(name5) ?? 0.0
            k_up2 = Double(name6) ?? 0.0
            k_up3 = Double(name7) ?? 0.0
            origin_price1 = Double(name8) ?? 0.0
            origin_price2 = Double(name9) ?? 0.0
            origin_price3 = Double(name10) ?? 0.0
            origin_up1 = Double(name11) ?? 0.0
            origin_up2 = Double(name12) ?? 0.0
            origin_up3 = Double(name13) ?? 0.0
            
            // Will output "theGreatestName"
        }
        var timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        viewupzd1.center.y  += view.bounds.height
        let myColor=UIColor(named: "0066CC")
        self.levelhouse.text = String(self.levelzd1i);
        self.namehouse.text = "Mayor";
        
    }
    @objc func timerAction() {
        money_score += up_money/100.0
        money_label.text = String(Int(money_score))
        levelzd1.text = String(Int(levelzd1i))
        moneypersecond.text = String(Int(up_money))
        let defaults = UserDefaults.standard
        defaults.set("\(String(money_score))", forKey: "money")
        defaults.set("\(String(up_money))", forKey: "upmoney")
        defaults.set("\(String(levelzd1i))", forKey: "level1")
        defaults.set("\(String(levelzd2i))", forKey: "level2")
        defaults.set("\(String(levelzd3i))", forKey: "level3")
        defaults.set("\(String(k_up))", forKey: "level1k")
        defaults.set("\(String(k_up2))", forKey: "level2k")
        defaults.set("\(String(k_up3))", forKey: "level3k")
        defaults.set("\(String(origin_price1))", forKey: "levelorigin_price")
        defaults.set("\(String(origin_price2))", forKey: "levelorigin_price2")
        defaults.set("\(String(origin_price3))", forKey: "levelorigin_price3")
        defaults.set("\(String(origin_up1))", forKey: "levelorigin_up")
        defaults.set("\(String(origin_up2))", forKey: "levelorigin_up2")
        defaults.set("\(String(origin_up3))", forKey: "levelorigin_up3")
    }
    @IBAction func click(_ sender: Any) {
        money_score += 1.0
        flag_click += 1
    }
    @IBAction func zd1_action(_ sender: Any) {
        if self.up_1bt.alpha == 1.0
        {
            usloviyazd1.text = "10 -\(String(format: "%.1f",(10.0))) + \(String(format: "%.1f",(1.0)))"
            UIView.animate(withDuration: 0.5, animations: {
              self.viewupzd1.center.y += self.view.bounds.height
                self.up_1bt.alpha = 0.0
                self.levelhouse.text = String(self.levelzd1i);
                self.namehouse.text = "Mayor";
            })
        }
        else
        {
            usloviyazd1.text = "-\(String(format: "%.1f",(origin_price1))) + \(String(format: "%.1f",(origin_up1)))"
            self.levelhouse2.alpha = 0.0
            self.levelhouse3.alpha = 0.0
            self.Up_3bt.alpha = 0.0
            self.Up_2bt.alpha = 0.0
            UIView.animate(withDuration: 0.5, animations: {
              self.viewupzd1.center.y -= self.view.bounds.height
                self.up_1bt.alpha = 1.0
                self.levelhouse.text = String(self.levelzd1i);
                self.namehouse.text = "Mayor";
                self.levelhouse.alpha = 1.0
                self.up_1bt.alpha = 1.0
            })

        }
    }
    @IBAction func exit_click(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
        self.viewupzd1.center.y += self.view.bounds.height
          self.up_1bt.alpha = 0.0})
    }
    @IBAction func up_1(_ sender: Any) {
        up_mayor()
        }
    
    @IBAction func up_2(_ sender: Any) {
        up_business()
    }
    
    @IBAction func up_3(_ sender: Any) {
        up_malla()
    }
    func up_mayor()
    {
        usloviyazd1.text = "-\(String(format: "%.1f",(origin_price1))) + \(String(format: "%.1f",(origin_up1)))"
        if money_score >= origin_price1
        {
            levelzd1i += 1
            money_score -= origin_price1
            up_money += origin_up1
            k_up *= 1.01
            origin_up1 = origin_up1 * k_up
            origin_price1 = origin_price1 * k_up
            money_label.text = String(Int(money_score))
            usloviyazd1.text = "-\(String(format: "%.1f",(origin_price1))) + \(String(format: "%.1f",(origin_up1)))"
            self.levelhouse.text = String(self.levelzd1i);
            
        }else
        {
            self.view_error.isHidden = false
            UIView.animate(withDuration: 0.5, animations: {
            self.viewupzd1.center.y += self.view.bounds.height
              self.up_1bt.alpha = 0.0})
        }
    }
    func up_business()
    {
        usloviyazd1.text = "-\(String(format: "%.1f",(origin_price2))) + \(String(format: "%.1f",(origin_up2)))"
        if money_score >= origin_price2
        {
            levelzd2i += 1
            money_score -= origin_price2
            up_money += origin_up2
            k_up2 *= 1.01
            origin_up2 = origin_up2 * k_up2
            origin_price2 = origin_price2 * k_up2
            money_label.text = String(Int(money_score))
            usloviyazd1.text = "-\(String(format: "%.1f",(origin_price2))) + \(String(format: "%.1f",(origin_up2)))"
            self.levelhouse2.text = String(self.levelzd2i);
            
        }else
        {
            self.view_error.isHidden = false
            UIView.animate(withDuration: 0.5, animations: {
            self.viewupzd1.center.y += self.view.bounds.height
              self.up_1bt.alpha = 0.0})
        }
    }
    func up_malla()
    {
        usloviyazd1.text = "-\(String(format: "%.1f",(origin_price3))) + \(String(format: "%.1f",(origin_up3)))"
        if money_score >= origin_price3
        {
            levelzd3i += 1
            money_score -= origin_price3
            up_money += origin_up3
            k_up3 *= 1.01
            origin_up3 = origin_up3 * k_up3
            origin_price3 = origin_price3 * k_up3
            money_label.text = String(Int(money_score))
            usloviyazd1.text = "-\(String(format: "%.1f",(origin_price3))) + \(String(format: "%.1f",(origin_up3)))"
            self.levelhouse3.text = String(self.levelzd3i);
            
        }else
        {
            self.view_error.isHidden = false
            UIView.animate(withDuration: 0.5, animations: {
            self.viewupzd1.center.y += self.view.bounds.height
              self.up_1bt.alpha = 0.0})
        }
    }
    @IBAction func start_business(_ sender: Any) {
        if self.up_1bt.alpha == 1.0
        {
            usloviyazd1.text = "-\(String(format: "%.1f",(origin_price2))) + \(String(format: "%.1f",(origin_up2)))"
            UIView.animate(withDuration: 0.5, animations: {
                self.viewupzd1.center.y += self.view.bounds.height
                self.up_1bt.alpha = 0.0
                self.levelhouse.text = String(self.levelzd1i);
                self.namehouse.text = "Business";
            })
        }
        else
        {
            
            self.up_1bt.alpha = 0.0
            self.Up_3bt.alpha = 0.0
            usloviyazd1.text = "-\(String(format: "%.1f",(origin_price2))) + \(String(format: "%.1f",(origin_up2)))"
            self.levelhouse.alpha = 0.0
            self.levelhouse3.alpha = 0.0
            UIView.animate(withDuration: 0.5, animations: {
              self.viewupzd1.center.y -= self.view.bounds.height
                self.up_1bt.alpha = 1.0
                self.levelhouse2.text = String(self.levelzd2i);
                self.namehouse.text = "Business";
                self.levelhouse2.alpha = 1.0
                self.Up_2bt.alpha = 1.0
            })

        }
    }
    @IBAction func start_mall(_ sender: Any) {
        if self.up_1bt.alpha == 1.0
        {
            usloviyazd1.text = "-\(String(format: "%.1f",(origin_price3))) + \(String(format: "%.1f",(origin_up3)))"
            UIView.animate(withDuration: 0.5, animations: {
              self.viewupzd1.center.y += self.view.bounds.height
                self.up_1bt.alpha = 0.0
                self.levelhouse3.text = String(self.levelzd3i);
                self.namehouse.text = "Mall";
            })
        }
        else
        {
            usloviyazd1.text = "-\(String(format: "%.1f",(origin_price3))) + \(String(format: "%.1f",(origin_up3)))"
            self.levelhouse2.alpha = 0.0
            self.levelhouse.alpha = 0.0
            self.up_1bt.alpha = 0.0
            self.Up_2bt.alpha = 0.0
            UIView.animate(withDuration: 0.5, animations: {
              self.viewupzd1.center.y -= self.view.bounds.height
                self.up_1bt.alpha = 1.0
                self.levelhouse3.text = String(self.levelzd3i);
                self.namehouse.text = "Mall";
                self.levelhouse3.alpha = 1.0
                self.Up_3bt.alpha = 1.0
            })

        }
    }
    func up_mall()
    {
        if money_score >= 10000
        {
            money_score -= 10
            up_money += 1;
            levelzd3i += 1;
            money_label.text = String(Int(money_score))
            usloviyazd1.text = "-\(String(format: "%.1f",(10.0))) + \(String(format: "%.1f",(1.0)))"
            self.levelhouse.text = String(self.levelzd1i);
            
        }else
        {
            self.view_error.isHidden = false
            UIView.animate(withDuration: 0.5, animations: {
            self.viewupzd1.center.y += self.view.bounds.height
              self.up_1bt.alpha = 0.0})
        }
        
    }
    @IBAction func but_exit(_ sender: Any) {
        self.view_error.isHidden = true
    }
    
    
    
}
