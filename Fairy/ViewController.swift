//
//  ViewController.swift
//  Fairy
//
//  Created by Liron Ezer on 09/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Home_TF_player1: UITextField!
    @IBOutlet weak var Home_TF_player2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func start(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "game") as! GameView
        
        if Home_TF_player1.text != nil{
            vc.player1 = Home_TF_player1.text!
        }
           
        if Home_TF_player2.text != nil{
            vc.player2 = Home_TF_player2.text!
        }
        
        
        present(vc, animated: true)
    }
    
}

