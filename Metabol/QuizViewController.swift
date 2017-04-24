//
//  QuizViewController.swift
//  Metabol
//
//  Created by Alan Valdez on 4/23/17.
//  Copyright © 2017 Alan Valdez. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quiz : String?
    var currentQuestion : Int = 0
    var currentCorrectAnswer : String = ""
    var questions : [AnyObject] = []
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var previousQuestionButton: UIButton!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    @IBAction func answer1(_ sender: UIButton) {
        checkQuestion(answerNumber: "1")
    }
    
    @IBAction func answer2(_ sender: UIButton) {
        checkQuestion(answerNumber: "2")
    }
    
    @IBAction func answer3(_ sender: UIButton) {
        checkQuestion(answerNumber: "3")
    }
    
    @IBAction func answer4(_ sender: UIButton) {
        checkQuestion(answerNumber: "4")
    }
    
    func prepareButtons() {
        for i in 0...answerButtons.count - 1 {
            answerButtons[i].backgroundColor = UIColor.flatNavyBlue()
        }
    }
    
    func turnOffButtons() {
        for i in 0...answerButtons.count - 1 {
            answerButtons[i].isHidden = true
        }
    }
    
    func loadQuestionJson(quiz: String) {
        do {
            if let file = Bundle.main.url(forResource: quiz, withExtension: "json") {
                let data = try Data(contentsOf: file)
                
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                if let object = json as? [String: AnyObject] {
                    // json is a dictionary
                    //print(object)
                    questions = object["questions"] as! [AnyObject]
                } else {
                    let alert = UIAlertController(title: "Error", message: "No se ha podido cargar la información del tema.", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    
                    present(alert, animated: true, completion: nil)
                }
            } else {
                let alert = UIAlertController(title: "Error", message: "No se ha podido cargar la información del tema.", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                    self.navigationController?.popViewController(animated: true)
                }))
                
                present(alert, animated: true, completion: nil)
            }
        } catch {
            let alert = UIAlertController(title: "Error", message: "No se ha podido cargar la información del tema.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                self.navigationController?.popViewController(animated: true)
            }))
            
            present(alert, animated: true, completion: nil)
        }
        
        if questions.count == 0 {
            let alert = UIAlertController(title: "Error", message: "No se ha podido cargar la información del tema.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                self.navigationController?.popViewController(animated: true)
            }))
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    func loadQuestion() {
        
        if currentQuestion < questions.count {
            let questionObject = questions[currentQuestion] as! [String:AnyObject]
            
            //print(questionObject)
            
            let question = questionObject["question"] as! String
            let answers = questionObject["answers"] as! [String:AnyObject]
            
            //print(answers)
            
            currentCorrectAnswer = questionObject["correct_answer"] as! String
            
            for i in 0...answers.count - 1 {
                
                let answer = answers[String(i + 1)] as! String
                
                //print(answer)
                
                answerButtons[i].setTitle(answer, for: .normal)
                answerButtons[i].isHidden = false
            }
            
            questionLabel.text = question
        }
        
    }
    
    func checkQuestion(answerNumber: String) {
        if answerNumber == currentCorrectAnswer {
            let alert = UIAlertController(title: "Correcto", message: "Felicidades, seleccionaste la respuesta correcta!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Incorrecto", message: "Esta no es la respuesta correcta. Vuelve a intentarlo.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        
        currentQuestion += 1
        
        if currentQuestion < questions.count - 1 {
            turnOffButtons()
            loadQuestion()
            
        } else if currentQuestion == questions.count - 1 {
            turnOffButtons()
            loadQuestion()
            nextQuestionButton.isHidden = true
    
            currentQuestion = questions.count - 1
        }
        
        previousQuestionButton.isHidden = false

    }
    
    
    @IBAction func previousQuestion(_ sender: UIButton) {
        
        currentQuestion -= 1
        
        if currentQuestion == 0 {
            turnOffButtons()
            loadQuestion()
            
            previousQuestionButton.isHidden = true
            
            currentQuestion = 0
            
        } else if currentQuestion < questions.count{
            turnOffButtons()
            loadQuestion()
        }
        
        nextQuestionButton.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareButtons()
        turnOffButtons()
        loadQuestionJson(quiz: quiz!)
        loadQuestion()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
