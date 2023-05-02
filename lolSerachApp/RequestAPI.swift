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
        let serachUrl = "/lol/summoner/v4/summoners/by-name/"
        let apiKey = "RGAPI-7b979bb6-7f8d-4b44-bbef-5e7334ed2d46"
        
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
                let resultDataModel = try decoder.decode(DataModel.self, from: data)
                completion(resultDataModel)
            }catch {
                print("데이터 파싱 실패!")
                return
            }
        }
        task.resume()

    }
}
