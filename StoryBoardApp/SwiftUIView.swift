//
//  SwiftUIView.swift
//  StoryBoardApp
//
//  Created by Student Account on 12/10/23.
//

import SwiftUI
import WebKit
import PDFKit

struct ContentView: View {
    var body: some View {
        TabView {
            PDFViewerView()
                .tabItem {
                    Label("PDF", systemImage: "doc.text")
                }
            WebView(url: URL(string: "https://www.example.com")!)
                .tabItem {
                    Label("Webpage", systemImage: "globe")
                }
        }
    }
}

struct PDFViewerView: UIViewRepresentable {
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        if let url = Bundle.main.url(forResource: "your-pdf-file", withExtension: "pdf"),
           let pdfDocument = PDFDocument(url: url) {
            pdfView.document = pdfDocument
        }
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        // Update the view.
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
