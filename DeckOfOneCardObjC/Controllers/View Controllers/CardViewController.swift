//
//  CardViewController.swift
//  DeckOfOneCardObjC
//
//  Created by Darin Marcus Armstrong on 7/2/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardSuitLabel: UILabel!
    
    var card: DACard?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        DACardController.shared()?.drawNewCard({ (cardArray) in
            DACardController.shared().fetchImage(from: cardArray![0] as? DACard, completion: { (image) in
                DispatchQueue.main.async {
                    self.cardImageView.image = image
                    let card = cardArray![0] as? DACard
                    self.cardSuitLabel.text = card?.suit                    
                }
            })
        })
    }
    
    @IBAction func drawButtonTapped(_ sender: UIButton) {
        updateViews()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
