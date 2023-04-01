//
//  ContentView.swift
//  SwiftUI-PopupNavigationView
//
//  Created by Ikmal Azman on 31/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State var shouldShowPopup : Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Show Popup") {
                    withAnimation(.easeIn) {
                        shouldShowPopup.toggle()
                    }
                }
            }
            .padding()
            .navigationTitle("Popup Navigation View")
            .popupNavigationView(show: $shouldShowPopup,
                                 horizontalPadding: 40,
                                 verticalPadding: 200) {
                taskView
            }
        }
    }
    
    var taskView : some View {
        List {
            ForEach(tasks) { task in
                NavigationLink(task.title) {
                    Text(task.description)
                }
            }
        }
        .navigationTitle("Popup Navigation View")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "xmark")
                    .onTapGesture {
                        withAnimation(.easeOut) {
                            shouldShowPopup.toggle()
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
