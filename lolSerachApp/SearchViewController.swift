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
        print("진입")
        Task {
            do {
                guard let summonerName = self.userName.text else{
                    return
                }
                
                let resultData = try await getData(summonerName: summonerName)
                let userData = try await userInfo(encryptedSummonerId: resultData.id?.description ?? "")
                print(userData[0].rank ?? "")
                DispatchQueue.main.async {
                    let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
                    detailVC.userName = (resultData.name ?? "")
                    detailVC.userLevel = (resultData.summonerLevel ?? 0)
                    detailVC.userTier = (userData[0].tier ?? "")
                    detailVC.userRank = (userData[0].rank ?? "")
                    detailVC.userWins = (userData[0].wins ?? 0)
                    detailVC.userLosses = (userData[0].losses ?? 0)
                    
                    self.navigationController?.pushViewController(detailVC, animated: true)
                }
                
            }catch {
                
            }
            
        }

    }
    
    func getData(summonerName: String) async throws -> DataModel {
        
        let baseUrl = "https://kr.api.riotgames.com"
        let apiKey = "RGAPI-bca21198-912a-482f-9e9e-4f1b5ca2a963"
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
    
    func userInfo(encryptedSummonerId: String) async throws -> [LeagueDataModel]{
        let baseUrl = "https://kr.api.riotgames.com"
        let apiKey = "RGAPI-bca21198-912a-482f-9e9e-4f1b5ca2a963"
        let serachUrl = "/lol/league/v4/entries/by-summoner/"
        
        guard let encodingName = encryptedSummonerId.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            throw MyErorr.errorIncoding
        }
        
        guard let url = URL(string:baseUrl + serachUrl + encodingName + "?api_key=" + apiKey) else {
            throw MyErorr.invalidUrl
        }
     
        
        let (data, response) = try await URLSession.shared.data(from: url)
     
        
        guard let httpResponse = (response as? HTTPURLResponse), httpResponse.statusCode == 200 else {
            throw MyErorr.badResponse
        }
        
        var userInfo: [LeagueDataModel]?
        
        do {
            userInfo = try JSONDecoder().decode([LeagueDataModel].self, from: data)
        }catch let error{
            print(error)
        }
        
        guard let userInfo = userInfo else {
            throw MyErorr.errorIncoding
        }
        
        return userInfo
    }
    
}

enum MyErorr: Error {
    
    case errorIncoding
    case invalidUrl
    case badResponse
}

