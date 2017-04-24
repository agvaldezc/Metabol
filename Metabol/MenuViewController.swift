//
//  MenuViewController.swift
//  Metabol
//
//  Created by Alan Valdez on 4/23/17.
//  Copyright © 2017 Alan Valdez. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    let topics = [["Biomoleculas"], ["Carbohidratos", "Glucosa"], ["Enzimas", "ATP", "Metabolismo"], ["Glucolisis", "Glucogenesis"]]
    
    let images : [String] = []
    
    var titlesToSend : [String] = []
    
    @IBOutlet weak var generales: UIView!
    @IBOutlet weak var carbohidratos: UIView!
    @IBOutlet weak var metabolismo: UIView!
    @IBOutlet weak var reacciones: UIView!
    
    
    @IBOutlet weak var generalesLabel: UILabel!
    @IBOutlet weak var carbohidratosLabel: UILabel!
    @IBOutlet weak var metabolismoLabel: UILabel!
    @IBOutlet weak var reaccionesLabel: UILabel!

    @IBAction func conocimientosTap(_ sender: Any) {
        titlesToSend = topics[0]
        performSegue(withIdentifier: "selectedCategory", sender: nil)
    }
    
    @IBAction func carbohidratosTap(_ sender: Any) {
        titlesToSend = topics[1]
        performSegue(withIdentifier: "selectedCategory", sender: nil)
    }
    
    @IBAction func metabolismoTap(_ sender: Any) {
        titlesToSend = topics[2]
        performSegue(withIdentifier: "selectedCategory", sender: nil)
    }
    
    @IBAction func reaccionesTap(_ sender: Any) {
        titlesToSend = topics[3]
        performSegue(withIdentifier: "selectedCategory", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initializeView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initializeView() {
         let textColor = navigationController?.navigationBar.barTintColor
        
        let contrastColor = UIColor.init(contrastingBlackOrWhiteColorOn: textColor, isFlat: true, alpha: 0.5)
        
        generales.backgroundColor = contrastColor
        carbohidratos.backgroundColor = contrastColor
        metabolismo.backgroundColor = contrastColor
        reacciones.backgroundColor = contrastColor
        
        generalesLabel.textColor = textColor
        carbohidratosLabel.textColor = textColor
        metabolismoLabel.textColor = textColor
        reaccionesLabel.textColor = textColor
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let newView = segue.destination as! ContentViewController
        
        newView.titles = titlesToSend
    }
}
