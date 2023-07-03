//
//  ContentView.swift
//  PDFViewer
//
//  Created by Abdullah on 01/07/2023.
//

import SwiftUI
import PDFKit

struct ContentView: View {
    let pdfUrl = Bundle.main.url(forResource: "sample", withExtension: "pdf")!
    func newDocument()
    {
        let newDocument = PDFDocument()
        let page = PDFPage(image : UIImage(systemName: "square.and.arrow.up.circle.fill")!)!
        newDocument.insert(page, at: 0)
    }
    

    var body: some View {
        VStack {
            
            Image(systemName: "doc.viewfinder")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("PDF Viewer")
                .foregroundColor(.accentColor)
            // Using the PDFKitView and passing the previously created pdfURL
            PDFKitView(url: pdfUrl)
                .scaledToFill()
        }
    }
}

// Add this:
struct PDFKitView: UIViewRepresentable {
    let url: URL
    func makeUIView(context: UIViewRepresentableContext<PDFKitView>) -> PDFView {
        // TODO
        let pdfView = PDFView()
            pdfView.document = PDFDocument(url: self.url)
            return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: UIViewRepresentableContext<PDFKitView>) {
        // TODO
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
