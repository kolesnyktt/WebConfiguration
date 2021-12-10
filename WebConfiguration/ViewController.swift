//
//  ViewController.swift
//  WebConfiguration
//
//  Created by Taras Kolesnyk on 09.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    var link: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        link = UserDefaults.standard.string(forKey: "link")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            if (self.link == nil) {
                self.networkCall()
            }
        })
    }
    
    func networkCall() {
        Service.sharedInstance.parseJSON { value in
            UserDefaults.standard.set(value.track, forKey: "link")
        }
    }

    @IBAction func goPlay(_ sender: Any) {
        link = UserDefaults.standard.string(forKey: "link")
        if (link != nil) {
            goToWeb()
            print("good")
        } else {
            goToGame()
        }
    }
    
    func goToWeb() {
        let webVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "webVC") as? WebViewController
        webVC?.url = link
        self.present(webVC!, animated: true, completion: nil)
    }
    
    func goToGame() {
        let gameVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "gameVC") as? GameViewController
        self.present(gameVC!, animated: true, completion: nil)
    }
}

