//
//  ViewController.swift
//  Sample_TableView
//
//  Created by Esat Kemal Ekren on 5.04.2018.
//  Copyright © 2018 Esat Kemal Ekren. All rights reserved.
//

import UIKit



class ViewController: UITableViewController {
    
    let cellId = "cellId"
    var products : [Product]  = [Product]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createProductArray()
        tableView.register(ProductCell.self, forCellReuseIdentifier: cellId)
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let vi = Header()
        vi.text = products[section].info
        vi.button.tag = section
        vi.button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        return vi
    }
    
   @objc func handleExpandClose(button: UIButton) {
        let section = button.tag
        var indexPaths = [IndexPath]()
        print(section)
        for row in products[section].data.indices {
            print(0, row)
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
   
        let isExpanded = products[section].isExpand
        products[section].isExpand = !isExpanded
        if isExpanded {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProductCell
        let currentLastItem = products[indexPath.section]
        cell.product = currentLastItem.data[0]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !products[section].isExpand {
            return 0
        }
        
        return products[section].data.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let vi = UIView()
        vi.backgroundColor = UIColor(red: 0.9098, green: 0.9294, blue: 0.902, alpha: 1.0)
        return vi
    }
    
    
    func createProductArray() {
        var data = [Item]()
        let item = Item(productName: "Total time: 7h 30 min", productImage: #imageLiteral(resourceName: "glasses") , productDesc: "This is best Glasses I've ever seen")
        data.append(item)
        products.append(Product(isExpand: false, info: "Mon, Sep 1    time: 8h30min", data: data))
        products.append(Product(isExpand: false, info: "Tue, Sep 2    time: 7h20min", data: data))
        products.append(Product(isExpand: false, info: "Wed, Sep 3    time: 7h20min", data: data))
        products.append(Product(isExpand: false, info: "Thu, Sep 4    time: 7h20min", data: data))
        products.append(Product(isExpand: false, info: "Fri, Sep 5    time: 7h20min", data: data))
        products.append(Product(isExpand: false, info: "Sat, Sep 6    time: 7h20min", data: data))
        products.append(Product(isExpand: false, info: "Sun, Sep 7    time: 7h20min", data: data))
       
    }
}



