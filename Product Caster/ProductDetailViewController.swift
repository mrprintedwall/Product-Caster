//
//  ProductDetailViewController.swift
//  Product Caster
//
//  Created by John Pili on 12/13/15.
//  Copyright © 2015 John Pili. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    var productImageName: String!
    var productName: String!
    var productPrice: Double!
    var productBrand: String!
    
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var productPriceLabel: UILabel!
    @IBOutlet var productBrandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        productImageView.image = UIImage(imageLiteral: productImageName)
        productNameLabel.text = productName
        productPriceLabel.text = String(productPrice)
        productBrandLabel.text = productBrand
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
