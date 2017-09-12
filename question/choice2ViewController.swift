//
//  choice2ViewController.swift
//  question
//
//  Created by Lianghan Lin on 2017/9/8.
//  Copyright © 2017年 Lianghan Lin. All rights reserved.
//

import UIKit
import GameKit

class choice2ViewController: UIViewController {
    
    var distribution: GKShuffledDistribution?
    
    let questionCount = 4
    var count = 0
    var number = 0
    var grade = 0
    
    
    @IBAction func choice2ButtonPressed(_ sender: UIButton) {
        let question2 = questions[number]
        let buttonIndex = choice2Buttons.index(of: sender)
        if question2.choices[buttonIndex!] == question2.answer{
            grade = grade + 25
        }
        nextQuestion()
    }
    
    func nextQuestion() {
        
        number = distribution!.nextInt()
        count = count + 1
        
        
        if count <= questionCount {
            updateUI()
        } else {
            performSegue(withIdentifier: "show2Result", sender: nil)
            
        }
    }
    
    @IBOutlet weak var question2Label: UILabel!
    
    @IBOutlet var choice2Buttons: [UIButton]!
    
    let questions = [Question2(description: "請問花一首歌的時間，可以做什麼?",answer: "寫出APP",choices: ["寫出APP","烤雞腿","跑半馬"]),Question2(description: "請問彼得潘最愛哪個牌子?",answer: "APPLE",choices: ["APPLE","HTC","OPPO"]),Question2(description: "請問Swift最帥老師是?",answer: "彼得潘",choices: ["彼得潘","劉的華","金城五"]),Question2(description: "請問最棒的星座是哪一個?",answer: "水瓶座",choices: ["水瓶座","射手座","雙子座"]),Question2(description: "請問彼得潘最愛誰?",answer: "戴佩妮",choices: ["戴資穎","戴佩妮","戴愛玲"])]
    
    func updateUI() {
        let question2 = questions[number]
        question2Label.text = question2.description
        var i = 0
        for choiceButton in choice2Buttons {
            choiceButton.setTitle(question2.choices[i], for: UIControlState.normal)
            i = i + 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        distribution = GKShuffledDistribution(lowestValue: 0, highestValue: questions.count - 1)
        
        number = distribution!.nextInt()
        count = count + 1
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwind2ToMultipleChoicePage(segue: UIStoryboardSegue) {
        distribution = GKShuffledDistribution(lowestValue: 0, highestValue: questions.count - 1)
        
        number = distribution!.nextInt()
        count = 1
        grade = 0
        updateUI()
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let controller = segue.destination as! result2ViewController
        controller.grade2 = grade
    }
    

}
