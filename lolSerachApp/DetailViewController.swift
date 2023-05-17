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
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var lossesLabel: UILabel!
    @IBOutlet weak var avgLabel: UILabel!
    
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
        self.rankLabel.text = userRank
        self.winLabel.text = userWins.description
        self.lossesLabel.text = userLosses.description
        
        let totalGames = userWins + userLosses
        let winRate = (Double(userWins) / Double(totalGames)) * 100
        self.avgLabel.text = Int(winRate).description
        
        guard let resultImage = tierImageChose(tier: userTier) else {
            fatalError("에러!")
        }
        tierImage.image = resultImage
    }
    
    func tierImageChose(tier: String) -> UIImage? {
        var tierImage: UIImage?
        
        switch tier {
        case "IRON" :
            tierImage = UIImage(named: "아이언")
        case "BRONZE" :
            tierImage = UIImage(named: "브론즈")
        case "SILVER" :
            tierImage = UIImage(named: "실버")
        case "GOLD" :
            tierImage = UIImage(named: "골드")
        case "PLATINUM" :
            tierImage = UIImage(named: "플레티넘")
        case "DIAMOND" :
            tierImage = UIImage(named: "다이아몬드")
        case "MASTER" :
            tierImage = UIImage(named: "마스터")
        case "GRANDMASTER" :
            tierImage = UIImage(named: "그랜드마스터")
        case "CHALLENGER" :
            tierImage = UIImage(named: "챌린저")
        default :
            break
        }
        
        return tierImage
    }
}
