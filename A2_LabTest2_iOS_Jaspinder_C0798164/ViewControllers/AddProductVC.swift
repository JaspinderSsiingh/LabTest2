//
//  AddProductVC.swift
//  A2_LabTest2_iOS_Jaspinder_C0798164
//
//  Created by Jaspinder Singh on 22/05/21.
//

import UIKit
import CoreData

class AddProductVC: UIViewController {

    @IBOutlet weak var txtFldProductId: UITextField!
    @IBOutlet weak var txtFldProductName: UITextField!
    @IBOutlet weak var txtFldProductPrice: UITextField!
    @IBOutlet weak var txtFldProductProvider: UITextField!
    @IBOutlet weak var txtVwProductDescription: UITextView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Add Product"

        // Do any additional setup after loading the view.
    }
    
    func getContext() -> NSManagedObjectContext {
        return appDelegate.persistentContainer.viewContext
    }
    
    func saveData() {
        let rowObj = NSEntityDescription.insertNewObject(forEntityName: "Products", into: getContext())
        rowObj.setValue(txtFldProductId.text!, forKey: "productId")
        rowObj.setValue(txtFldProductName.text!, forKey: "productName")
        rowObj.setValue(txtFldProductPrice.text!, forKey: "productPrice")
        rowObj.setValue(txtFldProductProvider.text!, forKey: "productProvider")
        rowObj.setValue(txtVwProductDescription.text!, forKey: "productDescription")
        
        
        do{
            try getContext().save()
            print("Saved")
            AlertControl.shared.showAlert("Success", message: "Product Added", buttons: ["Ok"]) { _ in
                self.navigationController?.popViewController(animated: true)
            }
        }catch{
            print("Error")
        }
    }
    
    @IBAction func btnActnSave(_ sender: Any) {
        var boolSave = false
        var strAlert = ""
        if txtFldProductId.text == "" {
            strAlert = "Please enter Product Id"
        } else if txtFldProductName.text == "" {
            strAlert = "Please enter Product Name"
        } else if txtFldProductPrice.text == "" {
            strAlert = "Please enter Product Price"
        } else if txtFldProductProvider.text == "" {
            strAlert = "Please enter Product Provider"
        } else if txtVwProductDescription.text == "" {
            strAlert = "Please enter Product Description"
        } else {
            boolSave = true
        }
        
        if boolSave {
            saveData()
        } else {
            AlertControl.shared.showAlert("Alert!", message: strAlert, buttons: ["OK"], completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
