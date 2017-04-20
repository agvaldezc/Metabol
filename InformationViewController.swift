//
//  InformationViewController.swift
//  Metabol
//
//  Created by Alan Valdez on 4/20/17.
//  Copyright © 2017 Alan Valdez. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
    var fileTitle : String?

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadFileInformation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadFileInformation() {
        if let filepath = Bundle.main.path(forResource: fileTitle!, ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                textView.text = contents
                
            } catch {
                // contents could not be loaded
                let alert = UIAlertController(title: "Error", message: "No se ha podido cargar la información del tema.", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                    self.navigationController?.popViewController(animated: true)
                }))
                
                present(alert, animated: true, completion: nil)
                
                
            }
        } else {
            // example.txt not found!
            let alert = UIAlertController(title: "Error", message: "No se ha podido cargar la información del tema.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                self.navigationController?.popViewController(animated: true)
            }))
            
            present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func infoActions(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Más acciones", message: "Selecciona Web para ver una página de consulta sobre el tema o selecciona Quiz para realizar un pequeño examen con respecto al tema.", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Web", style: .default, handler: { (UIAlertAction) in
            self.showWebView()
        }))
        
        alert.addAction(UIAlertAction(title: "Quiz", style: .default, handler: { (UIAlertAction) in
            self.showQuizView()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func showWebView() {
        performSegue(withIdentifier: "webView", sender: nil)
    }
    
    func showQuizView() {
        performSegue(withIdentifier: "quizView", sender: nil)
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
