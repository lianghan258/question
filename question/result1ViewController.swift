//
//  result1ViewController.swift
//  question
//
//  Created by Lianghan Lin on 2017/9/8.
//  Copyright © 2017年 Lianghan Lin. All rights reserved.
//

import UIKit

class result1ViewController: UIViewController {
    
    
    @IBAction func other1Button(_ sender: Any) {
    }
    
    @IBOutlet weak var grade1Label: UILabel!
    var grade1 = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        grade1Label.text = "\(grade1)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
