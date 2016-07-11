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
    var bgImage: UIImageView?
    internal var resultPokupka : String?
    internal var resultProdaja : String?
    internal var theProdaja : String?
    internal var thePokupka : String?

    @IBOutlet weak var LabelPrice: UILabel!
    @IBOutlet weak var labelPurchase: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var pokazatelPrice: UILabel!
    @IBOutlet weak var pokazatelPurchase: UILabel!
    @IBOutlet weak var priceImage: UIImageView!
    @IBOutlet weak var purcasheImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        htmlData()
        algoritm()
    }
    
    @IBAction func updateData(sender: AnyObject) {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)){
            dispatch_async(dispatch_get_main_queue(), {
                self.htmlData()
                self.algoritm()
            })
        }
    }
        
    func htmlData(){
        let myURLString = "http://duzios.xyz"
        let myURL = NSURL(string: myURLString)
        do {
            let pokupka = "//div/table/tbody/tr[1]/td[1]"
            let prodaja = "//div/table/tbody/tr[1]/td[2]"
            let HTML = try String(contentsOfURL: myURL!)
            let doc = try HTMLDocument(string: HTML, encoding: NSUTF8StringEncoding)
            
            for link in (doc.xpath("//*[contains(@class, 'price')]/td[1]")){
                print("ОБ Покупка - \(link.stringValue)")
                thePokupka = link.stringValue
                LabelPrice.text = thePokupka
            }
            
            for link in (doc.xpath("//*[contains(@class, 'price')]/td[2]")){
                print("ОБ Продажа - \(link.stringValue)")
                theProdaja = link.stringValue
                labelPurchase.text = theProdaja
            }
            
            for link in (doc.xpath("//td[@class = 'time']")){
                print("ОБ Дата - \(link.stringValue)")
                let date = link.stringValue
                labelDate.text = "Обновленно в - \(date)"
            }
            for link in (doc.xpath(pokupka)){
                resultPokupka = link.stringValue
                print("Изменение данных Покупка - \(resultPokupka!)")
            }
            for link in (doc.xpath(prodaja)){
                resultProdaja = link.stringValue
                print("Изменение данных Продажа - \(resultProdaja!)")
            }
            
        } catch let error as NSError {
            print("Error: \(error)")
        }
    }
    
    
    func algoritm(){
        let Pokupka : Int? = Int(thePokupka!)
        let Prodaja : Int? = Int(resultPokupka!)
        let FinalResult = Pokupka! - Prodaja!
        if (FinalResult < 0){
            let convert : String? = String(FinalResult)
            pokazatelPrice.textColor = UIColor.redColor()
            pokazatelPrice.text = convert
            priceImage.image = UIImage(named: "minus")
        } else{
            let convert : String? = String(FinalResult)
            pokazatelPrice.textColor = UIColor.greenColor()
            pokazatelPrice.text = convert
            priceImage.image = UIImage(named: "plus")
        }
        
        let twoPokupka : Int? = Int(theProdaja!)
        let twoProdaja : Int? = Int(resultProdaja!)
        
        let result = twoPokupka! - twoProdaja!
        
        if(result < 0){
            let resultConvert : String? = String(result)
            pokazatelPurchase.textColor = UIColor.redColor()
            pokazatelPurchase.text = resultConvert
            purcasheImage.image = UIImage(named: "minus")
        } else {
            let resultConvert : String? = String(result)
            pokazatelPurchase.textColor = UIColor.greenColor()
            pokazatelPurchase.text = resultConvert
            purcasheImage.image = UIImage(named: "plus")
        }
    }
    
    
}
