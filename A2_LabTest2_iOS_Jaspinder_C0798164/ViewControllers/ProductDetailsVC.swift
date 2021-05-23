//
//  ProductDetailsVC.swift
//  A2_LabTest2_iOS_Jaspinder_C0798164
//
//  Created by Jaspinder Singh on 22/05/21.
//

import UIKit

class ProductDetailsVC: UIViewController {
    
    @IBOutlet weak var lblProductId: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductPrice: UILabel!
    @IBOutlet weak var lblProductProvider: UILabel!
    @IBOutlet weak var lblProductDescription: UILabel!
    
    var productDetail: ProductDetailModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Product Details"
        
        lblProductId.text = "Product Id: \n" + productDetail.productId
        lblProductName.text = "Product Name: \n" + productDetail.productName
        lblProductPrice.text = "Product Price: \n$" + productDetail.productPrice
        lblProductProvider.text = "Product Provider: \n" + productDetail.productProvider
        lblProductDescription.text = "Product Description: \n" + productDetail.productDescription

        // Do any additional setup after loading the view.
    }
    
    

}
