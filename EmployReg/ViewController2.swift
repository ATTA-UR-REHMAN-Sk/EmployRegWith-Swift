//
//  ViewController2.swift
//  EmployReg
//
//  Created by ATTA SK on 16/08/2022.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var EmpImg: UIImageView!
    
    @IBOutlet weak var ENamelbl: UILabel!
    @IBOutlet weak var EPhnolbl: UILabel!
    @IBOutlet weak var EDesiglbl: UILabel!
    @IBOutlet weak var Editbtn: UIButton!
    
    var etitlelbl : String?
    var eid : String?
    var ename : String?
    var edesig : String?
    var epno : String?
    var eimg : UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EmpImg.setRounded()
        
//        EmpImg.layer.borderWidth = 1
//        EmpImg.layer.masksToBounds = false
//        EmpImg.layer.borderColor = UIColor.black.cgColor
//        EmpImg.layer.cornerRadius = EmpImg.frame.height/2
//        EmpImg.clipsToBounds = true

        // Do any additional setup after loading the view.
        
        ENamelbl.text = ename
        EPhnolbl.text = epno
        EDesiglbl.text = edesig
        EmpImg.image = eimg
    }
    
//    func dashbord()
//    {
//        ENamelbl.text = ename
//        EPhnolbl.text = epno
//        EDesiglbl.text = edesig
//    }


    @IBAction func Editbtn(_ sender: Any) {
        etitlelbl = "Edit"
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Logoutbtn(_ sender: Any) {
        
        let controller = storyboard? .instantiateViewController(identifier: "ViewController1") as! ViewController1
        self.present(controller, animated: true, completion: nil)
        
    }
    
}
extension UIImageView {
   func setRounded() {
    let radius = self.frame.width / 2
      self.layer.cornerRadius = radius
      self.layer.masksToBounds = true
   }
}
