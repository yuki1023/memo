//
//  ViewController.swift
//  memo
//
//  Created by 樋口裕貴 on 2020/04/13.
//  Copyright © 2020 Yuki Higuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource ,UITableViewDelegate{
    
    var memoArray = [String]()
    
    @IBOutlet var memoTableView : UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        memoTableView.dataSource = self
        memoTableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadMemo()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell")!
        cell.textLabel?.text = memoArray[indexPath.row]
        return cell
    }
    func loadMemo(){
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil{
            memoArray = ud.array(forKey: "memoArray") as! [String]
            memoTableView.reloadData()
        }
        
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // if segue.identifier == "toDetail "{
            let detailViewController = segue.destination as! DtailViewController
            let selectedIndexpath = memoTableView.indexPathForSelectedRow!
            print(selectedIndexpath)
            detailViewController.selectedMemo = memoArray[selectedIndexpath.row]
            detailViewController.selectedRow = selectedIndexpath.row

     //   }
        
    }
    
}

