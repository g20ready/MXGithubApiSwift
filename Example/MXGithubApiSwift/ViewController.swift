//
//  ViewController.swift
//  MXGithubApiSwift
//
//  Created by g20ready on 03/09/2017.
//  Copyright (c) 2017 g20ready. All rights reserved.
//

import UIKit
import MXGithubApiSwift


class ViewController: UIViewController, MXGithubApiManagerAuthDelegate {

    let clientId = "4f8c51b7a0f0be7cee0c"
    let redirectUrl = "https://github.viper.swift.auth/"
    override func viewDidLoad() {
        super.viewDidLoad()
        MXGithubApiManager.shared.clientId = clientId
        MXGithubApiManager.shared.redirectUrl = redirectUrl
        MXGithubApiManager.shared.authorizationDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func authorize(_ sender: Any) {
        MXGithubApiManager.shared.authenticate()
    }
    
    
    // MARK:- MXGithubApiManagerAuthDelegate
    
    func authorizationFinished(code: String) {
        print("authorizationFinished with code : \(code)")
    }

}

