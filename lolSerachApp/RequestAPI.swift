//
//  RequestAPI.swift
//  lolSerachApp
//
//  Created by 김승태 on 2023/05/01.
//

import Foundation

class RequestAPI {

    static func requestSummonerInfo(summonerName: String, completion: @escaping
    (DataModel) -> Void) {
        
        let baseUrl = "https://kr.api.riotgames.com"
        let apiKey = "RGAPI-d9e2890e-4856-4b92-bac8-ae25b55dafb8"
        let serachUrl = "/lol/summoner/v4/summoners/by-name/"
        
        let urlSession = URLSession.shared
        
        guard let encodingName = summonerName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            print("encodingName 생성 실패!")
            return
        }

        guard let url = URL(string: baseUrl + serachUrl + encodingName + "?api_key=" + apiKey) else {
            print("url 생성실패!")
            return
        }
    
        let request = URLRequest(url: url)
        
        let task = urlSession.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                print("데이터 가져오기 실패!")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                var resultDataModel = try decoder.decode(DataModel.self, from: data)
                
                self.requestMatchInfo(id: (resultDataModel.id ?? "")) { data in
                    resultDataModel.rank = data.rank
                    completion(resultDataModel)
                }
            }catch {
                print("데이터 파싱 실패!")
                return
            }
        }
        task.resume()
    }
    
    static func requestMatchInfo(id: String, completion: @escaping (UserInfoDataModel) -> Void) {
        
        let baseUrl = "https://kr.api.riotgames.com"
        let apiKey = "RGAPI-d9e2890e-4856-4b92-bac8-ae25b55dafb8"
        let searchUrl = "/lol/league/v4/entries/by-summoner/"
        
        let urlSession = URLSession.shared
        
        guard let id = id.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)else {
            return
        }
        
        guard let url = URL(string: baseUrl + searchUrl + id + "?api_key=" + apiKey)else {
            return
        }
        print(baseUrl + searchUrl + id + "?api_key=" + apiKey)
        let request = URLRequest(url: url)
        
        let task = urlSession.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                print("데이터 가져오기 실패!")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let resultDataModel = try decoder.decode(UserInfoDataModel.self, from: data)
                completion(resultDataModel)
            }catch {
                print("데이터 파싱 실패! 2")
                return
            }
        }
        task.resume()
    }

}
