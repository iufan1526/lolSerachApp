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

        Task {
            do {
                guard let summonerName = self.userName.text else{
                    return
                }
                
                let resultData = try await getData(summonerName: summonerName)
                
                DispatchQueue.main.async {
                    let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
                    detailVC.userName = (resultData.name ?? "")
                    
                    self.navigationController?.pushViewController(detailVC, animated: true)
                }
                
            }catch {
                
            }
            
        }
        
//        RequestAPI.requestSummonerInfo(summonerName: summonerName) { data in
//            DispatchQueue.main.async {
//                let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
//                detailVC.userName = (data.name ?? "")
//
//                self.navigationController?.pushViewController(detailVC, animated: true)
//            }
//        }
    }
    
    func getData(summonerName: String) async throws -> DataModel {
        
        let baseUrl = "https://kr.api.riotgames.com"
        let apiKey = "RGAPI-f35fdc26-eb95-454d-85d2-01948b96b88b"
        let serachUrl = "/lol/summoner/v4/summoners/by-name/"
        
        guard let encodingName = summonerName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            throw MyErorr.errorIncoding
        }
        
        guard let url = URL(string:baseUrl + serachUrl + encodingName + "?api_key=" + apiKey) else {
            throw MyErorr.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MyErorr.badResponse
        }
        
        let userInfo = try JSONDecoder().decode(DataModel.self, from: data)
        
        return userInfo
    }
    
}

enum MyErorr: Error {
    
    case errorIncoding
    case invalidUrl
    case badResponse
}

