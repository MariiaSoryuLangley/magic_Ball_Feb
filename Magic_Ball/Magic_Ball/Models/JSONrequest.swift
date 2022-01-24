//
//  JSONrequest.swift
//  Magic_Ball
//
//  Created by Mariia on 24.01.2022.
//

import Foundation

struct AnswerRequest: Decodable {
    
    let magic: Magic
    
}

struct Magic: Decodable {
    
    let question: String
    let answer: String
    let type: String
    
}
