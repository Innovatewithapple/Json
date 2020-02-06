//
//  ViewController.swift
//  UrLSession Api Call
//
//  Created by Tarun Meena on 06/02/20.
//  Copyright © 2020 Tarun Meena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var imgArray = [String]()
    var imgArray2 = [String]()
     var imgArray3 = [String]()
     var imgArray4 = [String]()
     var imgArray5 = [String]()
     var imgArray6 = [String]()
    var count = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        parse()
        tableView.rowHeight = 300
        // Do any additional setup after loading the view, typically from a nib.
    }

    func parse () {
        let url = Bundle.main.url(forResource: "cars", withExtension: "json")
        if let url = url
        {
            let data = try? Data(contentsOf: url)
            do {
                guard let data = data else {return}
                let json  = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                let carsArray = json?.value(forKey: "cars") as! NSArray
                
                count = carsArray.count
                for arrayData in carsArray {
                    let cars = arrayData as! [String:Any]
                    
                    guard let name = cars["name"] else {return}
                    imgArray.append(name as! String)
                    guard let name1 = cars["insta1"] else {return}
                    imgArray2.append(name1 as! String)
                    guard let name2 = cars["insta3"] else {return}
                    imgArray3.append(name2 as! String)
                    guard let name3 = cars["insta2"] else {return}
                    imgArray4.append(name3 as! String)
                    guard let name4 = cars["insta4"] else {return}
                    imgArray5.append(name4 as! String)
                    guard let name5 = cars["insta5"] else {return}
                    imgArray6.append(name5 as! String)
                }
            }
            
            catch let error as NSError
            {
                print(error.localizedDescription)
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! tCell
        cell.carImageView.image = UIImage(named: imgArray[indexPath.row])
        cell.image1.image = UIImage(named: imgArray2[indexPath.row])
        cell.image2.image = UIImage(named: imgArray3[indexPath.row])
        cell.image3.image = UIImage(named: imgArray4[indexPath.row])
        cell.image4.image = UIImage(named: imgArray5[indexPath.row])
        cell.image5.image = UIImage(named: imgArray6[indexPath.row])
        cell.image6.image = UIImage(named: imgArray[indexPath.row])
        cell.image7.image = UIImage(named: imgArray2[indexPath.row])
        cell.image8.image = UIImage(named: imgArray3[indexPath.row])
        cell.image9.image = UIImage(named: imgArray4[indexPath.row])
        cell.image10.image = UIImage(named: imgArray5[indexPath.row])
        cell.image11.image = UIImage(named: imgArray6[indexPath.row])
        
        return cell
     }
    
    
}
