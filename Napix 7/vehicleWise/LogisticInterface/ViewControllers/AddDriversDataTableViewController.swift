//
//  AddDriversDataTableViewController.swift
//  vehicleWise
//
//  Created by student on 01/05/24.
//

import UIKit

protocol AddDriversDelegate: AnyObject {
    func didAddNewDriver()
}

class AddDriversDataTableViewController: UITableViewController {
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var driverNameTextFeild: UITextField!
    
    @IBOutlet weak var driverMobileNumberTextFeild: UITextField!
    weak var delegate: AddDriversDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        saveButton.isEnabled = false
    }
    func updateSaveButtonState() {
           // Enable the save button only if the text field is not empty
           let driverMobileNumber = driverMobileNumberTextFeild.text ?? ""
        let driverName = driverNameTextFeild.text ?? ""
        saveButton.isEnabled = !driverName.isEmpty && !driverMobileNumber.isEmpty
       }
    
    @IBAction func cancelBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveDataBtnWasPressed(_ sender: Any) {
        
        if let name = driverNameTextFeild.text, let phone = driverMobileNumberTextFeild.text {
                   let newDriver = DriversList(name: name, mobileNumber: phone, imageDriver: "figure.seated.seatbelt")
                   dataModel.addDriversToDriverList(newDriver: newDriver)
                   delegate?.didAddNewDriver()
                   dismiss(animated: true, completion: nil)
        }
        
    }
   
    @IBAction func textDidChangedOfDriverMobileNumber(_ sender: Any) {
        updateSaveButtonState()
    }
    @IBAction func textDidChangedOfDriverName(_ sender: Any) {
        updateSaveButtonState()
    }
}
