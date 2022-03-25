//
//  ViewController.swift
//  Zuche2
//
//  Created by Ariel Nabavian on 4/2/20.
//  Copyright © 2020 Ariel Nabavian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var enterTime: UILabel!
    @IBOutlet weak var enterMonth: UILabel!
    @IBOutlet weak var enterValidYear: UILabel!
    @IBOutlet weak var enterYear: UILabel!
    @IBOutlet weak var enterDay: UILabel!
    @IBOutlet weak var month: UITextField!
    @IBOutlet weak var day: UITextField!
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var textMessage: UIImageView!
    
    @IBOutlet weak var textMessageArea: UITextField!
    
    @IBOutlet weak var InvalidEmail: UILabel!
    
    @IBOutlet weak var PasswordDoesNotMatch: UILabel!
    @IBOutlet weak var NoPassword: UILabel!
    @IBOutlet weak var noEmail: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    

    @IBAction func SingUpButton(_ sender: Any) {
        if emailField.text!.isEmpty{
            noEmail.isHidden=false
            PasswordDoesNotMatch.isHidden=true
            InvalidEmail.isHidden=true
            NoPassword.isHidden=true
        }else if passwordField.text!.isEmpty{
            NoPassword.isHidden=false
            noEmail.isHidden=true
            PasswordDoesNotMatch.isHidden=true
            InvalidEmail.isHidden=true
        }else if passwordField.text! != confirmPasswordField.text{
            PasswordDoesNotMatch.isHidden=false
            NoPassword.isHidden=true
            noEmail.isHidden=true
            InvalidEmail.isHidden=true
        }else if emailField.text!.contains(".com") && emailField.text!.contains("@"){
            performSegue(withIdentifier: "signUpSegue", sender: Any?.self)
        }else{
            InvalidEmail.isHidden=false
            NoPassword.isHidden=true
            noEmail.isHidden=true
            PasswordDoesNotMatch.isHidden=true
        }
    
    }
    
    @IBAction func sendButton(_ sender: Any) {
        textMessageArea.text! = ""
        textMessage.isHidden = false
    }
    

    @IBAction func prePaymentButton(_ sender: Any) {
        if month.text!.isEmpty{
            enterMonth.isHidden=false
            enterYear.isHidden=true
            enterTime.isHidden=true
            enterValidYear.isHidden=true
            enterDay.isHidden=true
        }else if day.text!.isEmpty{
            enterMonth.isHidden=true
            enterYear.isHidden=true
            enterTime.isHidden=true
            enterValidYear.isHidden=true
            enterDay.isHidden=false
        }else if year.text!.isEmpty{
            enterMonth.isHidden=true
            enterYear.isHidden=false
            enterTime.isHidden=true
            enterValidYear.isHidden=true
            enterDay.isHidden=true
        }else if time.text!.isEmpty{
            enterMonth.isHidden=true
            enterYear.isHidden=true
            enterTime.isHidden=false
            enterValidYear.isHidden=true
            enterDay.isHidden=true
        }else if year.text!.count != 4{
            enterMonth.isHidden=true
            enterYear.isHidden=true
            enterTime.isHidden=true
            enterValidYear.isHidden=false
            enterDay.isHidden=true
        }else{
            performSegue(withIdentifier: "prePaymentSegue", sender: Any?.self)
        }
    }
    
    @IBAction func addImageButton(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        
    }
    
}
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.editedImage] as? UIImage{
            img.image=selectedImage
            
        }
        dismiss(animated: true, completion: nil)
    }
}
