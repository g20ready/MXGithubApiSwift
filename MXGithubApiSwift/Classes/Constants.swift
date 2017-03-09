//
//  Constants.swift
//  Github-Viper
//
//  Created by Marsel Tzatzo on 09/03/2017.
//  Copyright © 2017 max. All rights reserved.
//

import Foundation


public struct Constants {
    
    public struct Github {
        
        public struct Api {
            
            public struct Urls {
                
                fileprivate static let baseUrl = "https://api.github.com"
                
                fileprivate static let authUrl = "https://github.com/login/oauth/authorize?scope=user:email"
                public static func getAuthUrl(_ clientId: String) -> String {
                    return String(format: "%@&client_id=%@", authUrl, clientId)
                }
                
                
                fileprivate static let userPath = "users"
                public static func getUserUrl(_ username: String) -> String {
                    return String(format: "%@/%@/%@", baseUrl, userPath, username)
                }
                
            }
            
        }
    }
    
}
