//
//  DetailView.swift
//  H4XOR News
//
//  Created by Stephen Learmonth on 20/10/2021.
//

import SwiftUI
import WebKit
import UIKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "www.google.com")
    }
}

struct WebView: UIViewControllerRepresentable {
    
    
    let urlString: String?
    
    func makeUIView(context: Context) -> some UIView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let safeString = urlString,
              let url = URL(string: safeString) else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
