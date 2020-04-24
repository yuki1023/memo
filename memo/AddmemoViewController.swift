//
//  AddmemoViewController.swift
//  memo
//
//  Created by 樋口裕貴 on 2020/04/13.
//  Copyright © 2020 Yuki Higuchi. All rights reserved.
//

import UIKit

class AddmemoViewController: UIViewController {

    
    @IBOutlet var memoTextView : UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func save(){
        let inputText = memoTextView.text
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil {
            var saveMemoArray = ud.array(forKey: "memoArray") as! [String]
            if inputText != nil{
                saveMemoArray.append(inputText!)
            }else{
                print("何も入力されていません")
                
            }
            
            ud.set(saveMemoArray, forKey: "memoArray")
            
        }else{
            var newMemoArray = [String]()
            
            if inputText != nil{
                newMemoArray.append(inputText!)
            }else{
                print("何も入力されていません")
                
            }
            
            ud.set(newMemoArray, forKey: "memoArray")
            
        }
        
        ud.synchronize()
        self.dismiss(animated: true, completion: nil)
       
        
        
        
        
        
        
        
        
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
