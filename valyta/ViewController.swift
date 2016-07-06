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
        htmlData()
    }
    
    @IBAction func updateData(sender: AnyObject) {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)){
            dispatch_async(dispatch_get_main_queue(), {
                self.reloadData()
            })
        }
    }
    
    
    func reloadData(){
        let myURLString = "http://duzios.xyz"
        let myURL = NSURL(string: myURLString)
        do {
            let HTML = try String(contentsOfURL: myURL!)
            let doc = try HTMLDocument(string: HTML, encoding: NSUTF8StringEncoding)
            
            for link in (doc.xpath("//*[contains(@class, 'price')]/td[1]")){
                print("ОБ Покупка - \(link.stringValue)")
                let pokupka = link.stringValue
                LabelPrice.text = pokupka
            }
            
            for link in (doc.xpath("//*[contains(@class, 'price')]/td[2]")){
                print("ОБ Продажа - \(link.stringValue)")
                let prodaja = link.stringValue
                labelPurchase.text = prodaja
            }
            
            for link in (doc.xpath("//td[@class = 'time']")){
                print("ОБ Дата - \(link.stringValue)")
                let date = link.stringValue
                labelDate.text = "Обновленно в - \(date)"
                
            }
            
            
        } catch let error as NSError {
            print("Error: \(error)")
        }
    }
    
    
    func htmlData(){
        let myURLString = "http://duzios.xyz"
        let myURL = NSURL(string: myURLString)
        do {
            let HTML = try String(contentsOfURL: myURL!)
            let doc = try HTMLDocument(string: HTML, encoding: NSUTF8StringEncoding)
            
            for link in (doc.xpath("//*[contains(@class, 'price')]/td[1]")){
                print("ОБ Покупка - \(link.stringValue)")
                let pokupka = link.stringValue
                LabelPrice.text = pokupka
            }
            
            for link in (doc.xpath("//*[contains(@class, 'price')]/td[2]")){
                print("ОБ Продажа - \(link.stringValue)")
                let prodaja = link.stringValue
                labelPurchase.text = prodaja
            }
            
            for link in (doc.xpath("//td[@class = 'time']")){
                print("ОБ Дата - \(link.stringValue)")
                let date = link.stringValue
                labelDate.text = "Обновленно в - \(date)"
                
            }
            
            
        } catch let error as NSError {
            print("Error: \(error)")
        }
    }
}
