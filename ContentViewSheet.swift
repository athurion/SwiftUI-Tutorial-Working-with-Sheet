//
//  ContentView.swift
//  SwiftUI Tutorial: Working with Sheet
//
//  Created by Alvin Sosangyo on 02/07/22.
//


import SwiftUI

struct ContentView: View {
    
    @State private var mainText: String = ""
    @State private var showSheet: Bool = false

    var body: some View {

        ZStack(alignment: .bottom) {

            ScrollView {
                Text(mainText)
                    .padding()
            }
            
            newNoteButton {
                showSheet.toggle()
            }

        } //ZStack
        .sheet(isPresented: $showSheet) {
            SheetView(mainText: $mainText)
        }

    } //body

} //ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct newNoteButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "square.and.pencil")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .padding(30)
        }
        .background(.blue)
        .foregroundColor(.white)
        .cornerRadius(.infinity)
        .padding()
    }
    
}

struct SheetView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var mainText: String
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Done")
                }
                .padding()
                
            } //HStack
            
            TextEditor(text: $mainText)
                .padding(.horizontal)
            
        } //VStack
        
    } //body
    
} //SheetView

