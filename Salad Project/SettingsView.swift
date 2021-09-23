//
//  SettingsView.swift
//  Salad Project
//
//  Created by Kevin Su on 27/8/2021.
//

//Settings page
import SwiftUI


struct SettingsView: View {
    
    @State var locationOn = true
    
    @State var height = CGFloat(UIScreen.main.bounds.height)
    @State var width =  CGFloat(UIScreen.main.bounds.width)
    @State var MainTab = CGSize.zero
    @State var ShowClass = false
    @State var `class` = ""
    @State private var darkMode = false
    @EnvironmentObject var settings: appSettings
   
    var body: some View {
            
            ZStack{
                NavigationView{
                    
                VStack{
                    
                    List{
                        Toggle("Toggle Dark Mode", isOn: $darkMode)
                            .onChange(of: darkMode) {value in
                                if darkMode == true{
                                    settings.toggleDarkMode = .dark
                                }
                                else{
                                    settings.toggleDarkMode = .dark
                                }
                            }
                        
                    
                        NavigationLink(destination: AboutView()){
                            Text("About this app")
                        }
                        NavigationLink(destination: BugView()){
                            Text("Report Bugs")
                        }
                        
                    }.padding(.top, 50.0)
                    
                    .listStyle(GroupedListStyle())
                    
                    .navigationBarTitle("App Settings")
                    .ignoresSafeArea()
                              
                        
                    
                    
                    
                }
                .ignoresSafeArea()
                
                
                
            }.ignoresSafeArea()
        }
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
