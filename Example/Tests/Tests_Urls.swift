//
//  Tests_Urls.swift
//  MXGithubApiSwift
//
//  Created by Marsel Tzatzo on 09/03/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import MXGithubApiSwift

class UrlContentSpec: QuickSpec {
    
    override func spec() {
        
        describe("validate urls") {
            
            it("authUrl") {
                let authUrl = Constants.Github.Api.Urls.getUserUrl("4f8c51b7a0f0be7cee0c")
                expect(authUrl) == "https://github.com/login/oauth/authorize?scope=user:email&client_id=4f8c51b7a0f0be7cee0c"
            }
            
            it("userUrl") {
                let userUrl = Constants.Github.Api.Urls.getUserUrl("g20ready")
                expect(userUrl) == "https://api.github.com/users/g20ready"
            }
        }
        
    }
}
