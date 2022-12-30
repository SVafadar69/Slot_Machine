//
//  InfoView.swift
//  Slot Machine
//
//  Created by Steven Vafadar on 2022-12-29.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LogoView()
            
            Spacer()
            
            
            Form {
                Section(header: Text("About the application")) {
                    FormRowView(firstItem: "Application", secondItem: "Slot Machine")
                    FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
                    FormRowView(firstItem: "Developer", secondItem: "John/Jane")
                    FormRowView(firstItem: "Designer", secondItem: "Robert Petras")
                    FormRowView(firstItem: "Music", secondItem: "Hans Zimmer")
                    FormRowView(firstItem: "Website", secondItem: "SwiftUIMasterclass.com")
                    FormRowView(firstItem: "Copyright", secondItem: "2022 - rights non-existent")
                    FormRowView(firstItem: "Version", secondItem: "1.0.0")
                }
            }
            .font(.system(.body, design: .rounded))
            
        }
        .padding(.top, 40)
        .overlay(
            Button(action: {
                self.presentationMode.wrappedValue.dismiss() //close the infoview - toggle presentationMode to be false 
            }) {
                Image(systemName: "xmark.circle")
                    .font(.title)
                
            }
                .padding(.top, 30)
                .padding(.trailing, 20)
                .accentColor(Color.secondary)
            ,alignment: .topTrailing
            )
    }
}

struct FormRowView: View { //extracted view: view to be reused throughout the code
    var firstItem: String
    var secondItem: String
    
    var body: some View {
        HStack {
            Text(firstItem).foregroundColor(Color.gray)
            Spacer()
            Text(secondItem)
            
        }
    }
}
//MARK: VIEW PREVIEW
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}


