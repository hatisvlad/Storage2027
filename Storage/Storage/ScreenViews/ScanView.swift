//
//  ScanView.swift
//  Storage
//
//  Created by Hatis Vlad Gabriel  on 22/05/2026.
//

import SwiftUI
import SwiftData
import VisionKit

struct ScanView: UIViewControllerRepresentable{
    @Binding var scannedCode: String
    @Environment(\.dismiss) var dismiss
    class Coordinator: NSObject, DataScannerViewControllerDelegate{
        var parent: ScanView
        init(_ parent: ScanView) {
            self.parent = parent
        }
        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            switch item {
            case .barcode(let barcode):
                // If it's a barcode, grab the text string inside it
                if let payloadString = barcode.payloadStringValue {
                    // Hand the string back to the SwiftUI text field!
                    parent.scannedCode = payloadString
                    parent.dismiss()
                }
            default:
                break
            }
        }
        //This was gemini beein a b and only giving this to me so this is what I wrote,
    }
    func makeCoordinator() -> Coordinator {
            return Coordinator(self)
    }

    func makeUIViewController(context: Context) -> DataScannerViewController {
         let scanner = DataScannerViewController(recognizedDataTypes: [.barcode()], isHighlightingEnabled: true)
        scanner.delegate = context.coordinator
        try? scanner.startScanning()
        return scanner
    }
    
    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        
    }
    }


#Preview {
    ScanView(scannedCode: .constant(""))
}
