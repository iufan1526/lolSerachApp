//
//  DetailViewController.swift
//  lolSerachApp
//
//  Created by 김승태 on 2023/05/01.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var userLevelLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(userName)
        self.nameLabel.text = userName
        // Do any additional setup after loading the view.
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
