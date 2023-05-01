//
//  ViewController.swift
//  lolSerachApp
//
//  Created by 김승태 on 2023/05/01.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func SearchMoveToDetail(_ sender: Any) {
        
        guard let summonerName = self.userName.text else{
            return
        }
        RequestAPI.requestSummonerInfo(summonerName: summonerName)
        
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
//    func loadData() {
//
//        let urlSession = URLSession.shared
//        let url = URL(string: <#T##String#>)
//    }
    
}

