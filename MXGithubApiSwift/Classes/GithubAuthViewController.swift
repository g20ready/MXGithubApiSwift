//
//  GithubAuthViewController.swift
//  Pods
//
//  Created by Marsel Tzatzo on 09/03/2017.
//
//

import UIKit

// MARK:-

class GithubAuthViewController: UIViewController, UIWebViewDelegate {

    // MARK:- IBOutlets
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK:- Initialization
    
    init() {
        let bundle = Bundle(for: GithubAuthViewController.self)
        super.init(nibName:"GithubAuthViewController",
                   bundle: bundle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let clientId = MXGithubApiManager.shared.clientId!
        if let url = URL(string: Constants.Github.Api.Urls.getAuthUrl(clientId)) {
            activityIndicator.startAnimating()
            self.webView.loadRequest(URLRequest(url: url))
        }

        print("GithubAuthViewController.viewDidLoad")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func dismissButtonClicked(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK:- UIWebViewDelegate
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        // TODO show error message here
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: UIWebView,
                 shouldStartLoadWith request: URLRequest,
                 navigationType: UIWebViewNavigationType) -> Bool
    {
        if let url = request.url?.absoluteString {
            let redirectUrl = "\(MXGithubApiManager.shared.redirectUrl!)?code="
            if url.contains(redirectUrl) {
                let code = url.replacingOccurrences(of: redirectUrl, with: "")
                MXGithubApiManager.shared.authorizationFinished(code: code)
                self.dismiss(animated: true, completion: nil)
            }
        }
        return true
    }
}
