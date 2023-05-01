//
//  RequestAPI.swift
//  lolSerachApp
//
//  Created by 김승태 on 2023/05/01.
//

import Foundation

class RequestAPI {
    
    static func requestSummonerInfo(summonerName: String) {
        let baseUrl = "https://kr.api.riotgames.com"
        let serachUrl = "/lol/summoner/v4/summoners/by-name/"
        let apiKey = "RGAPI-e76f6a33-a995-4ee3-aafd-657233e5b909"
        
        let urlSession = URLSession.shared
        let url = URL(string: baseUrl + serachUrl + summonerName + "?api_key=" + apiKey)
        
        guard let requestUrl = url else {
            return
        }
        
        let request = URLRequest(url: requestUrl)
        
        
    }
}
