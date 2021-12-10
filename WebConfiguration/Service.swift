//
//  Service.swift
//  WebConfiguration
//
//  Created by Taras Kolesnyk on 09.12.2021.
//

import Foundation
import UIKit
import WebKit

struct Service {
    
    static let sharedInstance = Service()
    
    var webView: WKWebView!

    func parseJSON (completion: @escaping ((ResultGame1) -> ())){
        let jsonUrlString = "http://apps.vortexads.io/guest?app=666666&uuid=123"
        guard let url = URL(string: jsonUrlString) else { return  }
        URLSession.shared.dataTask(with: url) { (data, responce, err) in
            guard let data = data else { return }
            do {
                var value = try JSONDecoder().decode(ResultGame1.self, from: data)
                completion(value)
                
            } catch let jsonErr {
                print("Error",jsonErr)
            }
        }.resume()
    }
}
struct ResultGame1: Decodable{
    let home: String
    let status: Bool
    let track: String
}
