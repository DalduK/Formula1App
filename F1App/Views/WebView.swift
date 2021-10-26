//
//  WebView.swift
//  F1App
//
//  Created by Przemysław Woźny on 24/10/2021.
//

import Foundation
import SwiftUI
import WebKit
import UIKit

public struct WebView: UIViewRepresentable {
    let requestURL: URLRequest
    
    public func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    public func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(requestURL)
    }
}
