//
//  MXGithubApiManager.swift
//  Pods
//
//  Created by Marsel Tzatzo on 09/03/2017.
//
//

import UIKit

// MARK:- GithubAuthViewControllerDelegate

public protocol MXGithubApiManagerAuthDelegate: class {
    
    func authorizationFinished(code: String)
    
}

public class MXGithubApiManager: NSObject {

    // MARK:- Singleton
    
    public static let shared = MXGithubApiManager()
    
    // MARK:- Delegate
    
    public weak var authorizationDelegate: MXGithubApiManagerAuthDelegate?
    
    // MARK:- Properties
    
    // ClientId of the application
    public var clientId: String?
    
    // Redirect url for authorization
    public var redirectUrl: String?
    
    // Code returned from authorization
    fileprivate var code: String?
    
    override init() {
        print("MXGithubApiManager.init")
    }
    
    public func authenticate() {
        if let clientId = self.clientId, let redirectUrl = self.redirectUrl {
            let authViewController = GithubAuthViewController()
            UIApplication.shared.windows[0].rootViewController?.present(authViewController,
                                                                        animated: true,
                                                                        completion: nil)
        }else {
            print("Client Id or redirectUrl not set")
        }
    }
}

// MARK:- Authorization Extension

extension MXGithubApiManager {
    
    func authorizationFinished(code: String) {
        self.code = code
        if let delegate = self.authorizationDelegate {
            delegate.authorizationFinished(code: code)
        }
    }
    
}
