//
//  DiceeViewController.swift
//  Dicce
//
//  Created by Stefanini on 13/09/18.
//  Copyright © 2018 Stefanini. All rights reserved.
//

import UIKit

class DiceeViewController: UIViewController {
    
    @IBOutlet weak var diceeImageView1: UIImageView!
    @IBOutlet weak var diceeImageView2: UIImageView!
    
    let diceArray = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    
    func randomNumber(number : UInt32) -> Int {
        return Int(arc4random_uniform(number))
    }
    
    func updateDiceImage(currentImage image : UIImageView, nameImage : String ) {
        image.image = UIImage(named: nameImage)
    }
    
    func updateDiceImages() {
        updateDiceImage(
            currentImage: diceeImageView2,
            nameImage: diceArray[randomNumber(number: 6)]
        )
        updateDiceImage(
            currentImage: diceeImageView1,
            nameImage: diceArray[randomNumber(number: 6)]
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDiceImages()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            updateDiceImages()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func rollButtonAction(_ sender: UIButton) {
        updateDiceImages()
    }
}
