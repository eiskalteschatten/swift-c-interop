//
//  ContentView.swift
//  swift-c-interop
//
//  Created by Benjamin Seifert on 25.02.25.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var greeting: String = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Type your name below:")
            TextField("Name", text: $name)
                .frame(maxWidth: 200)

            Button(action: submit) {
                Text("Submit")
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(greeting),
                    message: Text("This is a message from C."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .padding()
    }
    
    private func submit() {
        name.withCString { cName in
            let mutableCString = UnsafeMutablePointer(mutating: cName)
            let result = append_name(mutableCString)
            greeting = String(cString: result!)
            showAlert = true
        }
    }
}

#Preview {
    ContentView()
}
