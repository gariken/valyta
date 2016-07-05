//
//  ViewController.swift
//  valyta
//
//  Created by Александр on 26.06.16.
//  Copyright © 2016 Александр. All rights reserved.
//

import UIKit
import Fuzi

class ViewController: UIViewController {

    @IBOutlet weak var LabelPrice: UILabel!
    @IBOutlet weak var labelPurchase: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func updateData(sender: AnyObject) {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)){
            dispatch_async(dispatch_get_main_queue(), {
            })
        }
    }
    
    /*
    func reloadData(){
        let myURLString = "http://duzios.xyz"
        let myURL = NSURL(string: myURLString)
        do {
            let HTML = try String(contentsOfURL: myURL!)
            let doc = Kanna.HTML(html: HTML, encoding: NSUTF8StringEncoding)
            
            for link in (doc?.xpath("//*[contains(@class, 'price')]/td[1]"))!{
                print("ОБ Покупка - \(link.text)")
                let pokupka = link.text
                LabelPrice.text = pokupka
            }
            
            for link in (doc?.xpath("//*[contains(@class, 'price')]/td[2]"))!{
                print("ОБ Продажа - \(link.text)")
                let prodaja = link.text
                labelPurchase.text = prodaja
            }
            
            for link in (doc?.xpath("//td[@class = 'time']"))!{
                print("ОБ Дата - \(link.text)")
                let date = link.text
                labelDate.text = "Обновленно в - \(date!)"
                
            }
            
            
        } catch let error as NSError {
            print("Error: \(error)")
        }
    }
    
    
    func htmlData(){
        let myURLString = "http://duzios.xyz"
        guard let myURL = NSURL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return
        }
        
        do {
            let HTML = try String(contentsOfURL: myURL)
            let doc = Kanna.HTML(html: HTML, encoding: NSUTF8StringEncoding)
            
            for link in (doc?.xpath("//*[contains(@class, 'price')]/td[1]"))!{
                print("Покупка - \(link.text)")
                let pokupka = link.text
                LabelPrice.text = pokupka
            }
            
            for link in (doc?.xpath("//*[contains(@class, 'price')]/td[2]"))!{
                print("Продажа - \(link.text)")
                let prodaja = link.text
                labelPurchase.text = prodaja
            }
            
            for link in (doc?.xpath("//td[@class = 'time']"))!{
                print("Дата - \(link.text)")
                let date = link.text
                labelDate.text = "Обновленно в - \(date!)"
                
            }
            
            
        } catch let error as NSError {
            print("Error: \(error)")
        }
    }
   */
}
*/*/*/*/
}