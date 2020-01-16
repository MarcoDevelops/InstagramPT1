//
//  CameraViewController.swift
//  Instagram
//
//  Created by Marco Cruz on 1/11/20.
//  Copyright © 2020 Marco Cruz. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage
class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var commentField: UITextField!
    
    @IBAction func OnSubmitButton(_ sender: Any) {
        
        print("On submit button")
        
        let post = PFObject(className: "Posts")
        
        post["caption"] = commentField.text!
        post["author"] = PFUser.current()!
        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(data: imageData!)
        
        post["image"] = file
        
        
        post.saveInBackground(){(success, error) in
            if success{
                self.dismiss(animated: true, completion: nil)
                print("saved!")
              
            }else{
                print("error!")
                
            }
            
            
            
        }
        
//
//
//
//
//        let post = PFObject(className: "Posts")
//
//         post["caption"] = commentField.text!
//         post["author"] = PFUser.current()!
//
//         let imageData = imageView.image!.pngData()
//         let file = PFFileObject(data: imageData!)
//
//         post["image"] = file
//
//
//         post.saveInBackground(){(success, error) in
//             if success{
//                 self.dismiss(animated: true, completion: nil)
//                 print("saved!")
//
//             }else{
//                 print("error!")
//
//             }
//
//
//
//         }
//
//
        
    }
    
    @IBAction func OnCameraButton(_ sender: Any) {
        print("Hi i am the ion camera button")
        
        
        
        let picker = UIImagePickerController()
              picker.delegate = self
              picker.allowsEditing = true
              
              
              if UIImagePickerController.isSourceTypeAvailable(.camera){
                  picker.sourceType = .camera
              } else{
                  
                  picker.sourceType = .photoLibrary
              }
              present(picker, animated: true, completion: nil)
        
//        let picker = UIImagePickerController()
//        picker.delegate = self
//        picker.allowsEditing = true
//
//        if UIImagePickerController.isSourceTypeAvailable(.camera){
//
//            picker.sourceType = .camera
//        }
//        else{
//
//             picker.sourceType = .photoLibrary
//        }
//
//        present(picker, animated: true, completion: nil)

        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         
         // gives you a dictionary with pictures
         
         let image = info[.editedImage] as! UIImage
         let size = CGSize(width: 298, height: 298)
         let scaledImage = image.af_imageScaled(to: size)
         
         
        
        imageView.image = scaledImage
        dismiss(animated: true, completion: nil)
         
     }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
