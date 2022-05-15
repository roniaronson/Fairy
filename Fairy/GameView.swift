//
//  GameView.swift
//  Fairy
//
//  Created by Liron Ezer on 09/05/2022.
//

import UIKit

class GameView: UIViewController {

    @IBOutlet weak var Game_LBL_round: UILabel!
    @IBOutlet weak var Game_LBL_player1: UILabel!
    @IBOutlet weak var Game_LBL_score1: UILabel!
    @IBOutlet weak var Game_IMG_palyer1: UIImageView!
    @IBOutlet weak var Game_LBL_player2: UILabel!
    @IBOutlet weak var Game_LBL_score2: UILabel!
    @IBOutlet weak var Game_IMG_player2: UIImageView!

    
    var player1: String = "Player1"
    var player2: String = "Player2"
    var gameCounter: Int = 0
    var score1: Int = 0
    var score2: Int = 0
    var timer = Timer();
    let images = [#imageLiteral(resourceName: "witch4"), #imageLiteral(resourceName: "fairy4"), #imageLiteral(resourceName: "witch2"), #imageLiteral(resourceName: "fairy5"), #imageLiteral(resourceName: "witch1"), #imageLiteral(resourceName: "fairy3"), #imageLiteral(resourceName: "witch4"), #imageLiteral(resourceName: "fairy2"), #imageLiteral(resourceName: "witch1"), #imageLiteral(resourceName: "fairy2")]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255/255, green: 192/255, blue: 211/255, alpha: 1)
        setNames()
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 2,repeats: true , block: {_ in
            self.playGame();
            self.gameCounter += 1
            self.Game_LBL_round.text = "Round:\(self.gameCounter)"
            
            if self.gameCounter == 15{
                self.timer.invalidate(); //Stops timer
                self.checkFinalWinner();
            }
        })

        // Do any additional setup after loading the view.
    }
    
    func setNames(){
        if player1.isEmpty{
            Game_LBL_player1.text = "Player 1"
        }else{
            Game_LBL_player1.text = player1
        }
        
        if player2.isEmpty{
            Game_LBL_player2.text = "Player 2"
        }else{
            Game_LBL_player2.text = player2
        }
    }
    
    func playGame(){
        Game_IMG_palyer1.image = images.randomElement()
        Game_IMG_player2.image = images.randomElement()
        
        let index1 : Int = images.firstIndex(of:Game_IMG_palyer1.image!)!
        let index2 : Int = images.firstIndex(of:Game_IMG_player2.image!)!
        
        if(index1 % 2 == 0) {
            if(index2 % 2 == 1){
                updateScore(2)
            }
            else{
                updateScore(0)
            }
        }
        else{
            if(index2 % 2 == 0){
                updateScore(1)
            }
            else{
                updateScore(0)
            }
        }
    }
    
    func updateScore(_ number : Int){

        if ( number == 1){
            score1 += 1
        
        }
        if ( number == 2){
            score2 += 1
        }
        Game_LBL_score1.text = "\(score1)"
        Game_LBL_score2.text = "\(score2)"
    }
    
    func checkFinalWinner(){
        if(score1 > score2){
            Game_LBL_round.text = "GAME OVER!  \(player1) wins!"
        }
        if(score1 < score2){
            Game_LBL_round.text = "GAME OVER! \(player2) wins!"
        }
        if(score1 == score2){
            Game_LBL_round.text = "GAME OVER! It's A Tie!"
        }
    }
}


    


