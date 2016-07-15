//
//  histroryViewController.swift
//  valyta
//
//  Created by Александр on 15.07.16.
//  Copyright © 2016 Александр. All rights reserved.
//

import UIKit
import Fuzi

class histroryViewController: UITableViewController {
    
    var Prodaja : [String] = []
    var Pokupka : [String] = []
    var Data : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        goData()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! historyCell
        
        cell.prodajaLabel.text = Prodaja[indexPath.row]
        cell.pokupkaLabel.text = Pokupka[indexPath.row]
        cell.dataLabel.text = Data[indexPath.row]
        

        return cell
    }
    
    
    func goData(){
        let url = NSURL(string: "http://duzios.xyz")
        let pokupka = "//div/table/tbody/tr/td[1]"
        let prodaja = "//div/table/tbody/tr/td[2]"
        let data = "//div/table/tbody/tr/td[3]"
        
        do{
            let HTML = try String(contentsOfURL: url!)
            let doc = try HTMLDocument(string: HTML, encoding: NSUTF8StringEncoding)
            
            for link in (doc.xpath(pokupka)){
                Pokupka.append(link.stringValue)
            }
            
            for link in (doc.xpath(prodaja)){
                Prodaja.append(link.stringValue)
            }
            
            for link in (doc.xpath(data)){
                Data.append(link.stringValue)
            }
            
        } catch{
            print("Произошла ошибка\(error)")
        }
        
    }


}
