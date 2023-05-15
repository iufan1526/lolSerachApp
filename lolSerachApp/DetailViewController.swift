//
//  DetailViewController.swift
//  lolSerachApp
//
//  Created by 김승태 on 2023/05/01.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var tierLabel: UILabel!
    @IBOutlet weak var tierImage: UIImageView!
    
    var userName: String = ""
    var userTier: String = ""
    var userWins: Int = 0
    var userLosses: Int = 0
    var userRank: String = ""
    var userLevel: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.nameLabel.text = userName
        self.tierLabel.text = userTier
        self.levelLabel.text = userLevel.description
    }

}
