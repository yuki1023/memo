//
//  DtailViewController.swift
//  memo
//
//  Created by 樋口裕貴 on 2020/04/13.
//  Copyright © 2020 Yuki Higuchi. All rights reserved.
//

import UIKit

class DtailViewController: UIViewController {
    
    var selectedRow : Int!

    var selectedMemo : String!
    
    @IBOutlet var memoTextView : UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        memoTextView.text = selectedMemo
        
        // Do any additional setup after loading the view.
    }
    @IBAction func deleteMemo (){
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil{
            var saveMemoArray = ud.array(forKey: "memoArray") as! [String]
            saveMemoArray.remove(at: selectedRow)
            ud.set(saveMemoArray, forKey: "memoArray")
            ud.synchronize()
            self.navigationController?.popViewController(animated: true)
        }
        
        
    }
    

    

}
