//
//  ViewController.swift
//  EmployReg
//
//  Created by ATTA SK on 16/08/2022.
//

import UIKit

class ViewController1: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var Titlelbl: UILabel!
    
    @IBOutlet weak var nametxt: UITextField!
    
    @IBOutlet weak var Designtxt: UITextField!
    
    @IBOutlet weak var Phonetxt: UITextField!
    
    @IBOutlet weak var Emptxt: UITextField!
    
    @IBOutlet weak var uploadbtn: UIButton!
    
    @IBOutlet weak var Regbtn: UIButton!
    
    @IBOutlet weak var Eimage: UIImageView!
    
    @IBOutlet weak var Uplodbtn: UIButton!
    @IBOutlet weak var Regsbtn: UIButton!
    
    var titlelbl : String?
    var name : String?
    var desig : String?
    var phone : String?
    var empid : String?
    var imag : UIImage!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Eimage.layer.borderWidth = 1
            Eimage.layer.masksToBounds = false
           Eimage.layer.borderColor = UIColor.black.cgColor
        Eimage.layer.cornerRadius = Eimage.frame.height/2
            Eimage.clipsToBounds = true
        
        
        Uplodbtn.layer.cornerRadius = 20
        Regsbtn.layer.cornerRadius = 20
    }

    
    @IBAction func Uploadbtn(_ sender: Any) {

        let imag = UIImagePickerController()
               imag.delegate = self
               imag.sourceType = UIImagePickerController.SourceType.photoLibrary
               imag.allowsEditing = false
               self.present(imag , animated:  true )
               {
                   
                   //browseimg.image = imag
                   ///code not need now
               }
           }
           func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
               if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
               {
                   
                Eimage.image = resizeImage(image: image, newWidth: 100)
                   
              //  MyImageView.image = image
                
                Eimage.image = image
                
                   /////////////////////image base64//////////
//
//                   let data: Data = Eimage.image!.pngData()!
                  // base64 = data.base64EncodedString()

                  // sdf = data.saveImage(image: browseimg, imageName: )
                   //    print(base64)
               }
               else{
                   
                   //error
               }
               self.dismiss(animated: true, completion: nil)
         
    }
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
            let scale = newWidth / image.size.width
            let newHeight = image.size.height * scale
            UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
            image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return newImage!
            
        }
        
    
    
    @IBAction func Registerbtn(_ sender: UIButton) {
        
        if self.nametxt.text?.isEmpty==true
             {
             self.nametxt.layer.borderColor = UIColor.red.cgColor
             self.nametxt.layer.borderWidth = 1.0
             }
        if self.Designtxt.text?.isEmpty==true {
            self.Designtxt.layer.borderColor = UIColor.red.cgColor
            self.Designtxt.layer.borderWidth = 1.0
//            Designtxt.backgroundColor = UIColor.red
//            print("plz fill contact field")
        }
        if self.Phonetxt.text?.isEmpty==true {
            self.Phonetxt.layer.borderColor = UIColor.red.cgColor
            self.Phonetxt.layer.borderWidth = 1.0
            
            //Phonetxt.backgroundColor = UIColor.red
//            print("plz fill Design field")
        }
        if self.Emptxt.text?.isEmpty==true {
            self.Emptxt.layer.borderColor = UIColor.red.cgColor
            self.Emptxt.layer.borderWidth = 1.0
            
//            Emptxt.backgroundColor = UIColor.red
//            print("plz fill EmpID field")
        }
        else{
            
            titlelbl = Titlelbl.text!
            name = nametxt.text!
            desig = Designtxt.text!
            phone = Phonetxt.text!
            empid = Emptxt.text!
            imag = Eimage.image
            
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController2") as? ViewController2
        self.navigationController?.pushViewController(vc!, animated: true)
        
            //vc?.etitlelbl = titlelbl
        vc?.ename = name
        vc?.edesig = desig
        vc?.epno = phone
        vc?.eid = empid
        vc?.eimg = imag
        }
        
    }
    }
