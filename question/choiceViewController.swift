//
//  choiceViewController.swift
//  question
//
//  Created by Lianghan Lin on 2017/9/8.
//  Copyright © 2017年 Lianghan Lin. All rights reserved.
//

import UIKit
import GameKit

class choiceViewController: UIViewController {
    
    var distribution: GKShuffledDistribution?
    
    let questionCount = 4
    var count = 0
    var number = 0
    var grade = 0
    
    
    @IBAction func choice1ButtonPressed(_ sender: UIButton) {
        let question1 = questions[number]
        let buttonIndex = choice1Buttons.index(of: sender)
        if question1.choices[buttonIndex!] == question1.answer{
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
            performSegue(withIdentifier: "show1Result", sender: nil)
            
        }
    }
    
    @IBOutlet weak var question1Label: UILabel!
    
    @IBOutlet var choice1Buttons: [UIButton]!
    
    let questions = [Question1(description: "請問2017年世大運在哪個城市舉辦?",answer: "台北",choices: ["台北","首爾","東京"]),Question1(description: "請問iPhone在9月12日要發表哪款手機?",answer: "iPhone8",choices: ["iPhone8","iPhone9","iPhone10"]),Question1(description: "請問台北市第一高峰是?",answer: "七星山",choices: ["大屯山","七星山","紗帽山"]),Question1(description: "請問「舉頭望明月，低頭_ _ _」為何?",answer: "思故鄉",choices: ["思故鄉","吃便當","滑手機"]),Question1(description: "請問故宮本院最著名收藏為何?",answer: "翠玉白菜",choices: ["翠玉白菜","高山高麗菜","剛入伍好菜"])]
    
    
    func updateUI() {
        let question1 = questions[number]
        question1Label.text = question1.description
        var i = 0
        for choiceButton in choice1Buttons {
            choiceButton.setTitle(question1.choices[i], for: UIControlState.normal)
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
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwind1ToMultipleChoicePage(segue: UIStoryboardSegue) {
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
        
        let controller = segue.destination as! result1ViewController
        controller.grade1 = grade
    }
 

}

