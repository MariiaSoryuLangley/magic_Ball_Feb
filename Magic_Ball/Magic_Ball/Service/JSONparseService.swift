//
//  JSONparseService.swift
//  Magic_Ball
//
//  Created by Mariia on 24.01.2022.
//


import SwiftUI
import Alamofire


final class JSONparseService{
    
    @ObservedObject private var appState: AppState = AppState()
    
    func setAppState(appState: AppState) {
        
        self.appState = appState
        
    }
    
    
    func postGetLoginRequest(completion: @escaping () -> Void)
    {
        guard let url = URL(string: "https://8ball.delegator.com/magic/JSON/%3C\(appState.questionText)%3E") else {
            print("Invalid URL")
            return
        }
        
        
        
        AF.request(url, method: .get, encoding: URLEncoding.default).responseData{ response in
            switch response.result {
                
            case.success(let value):
                
                do{
                    let loginResponse = try JSONDecoder().decode(AnswerRequest.self, from: value)
                    let isSucces = loginResponse.magic.answer
                    print(isSucces)
                    
                    self.appState.answerText = isSucces
                    
                }catch {
                    
                
                    
                }
                
                
            case .failure(let error):
                
                print(error)
                
            }
            completion()
            
        }
        
        
    }
    
}
