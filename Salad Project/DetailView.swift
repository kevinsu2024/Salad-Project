//
//  DetailView.swift
//  Salad Project
//
//  Created by Yunfan Yang on 9/22/21.
//

import SwiftUI
import MapKit

struct DetailView: View {
    @EnvironmentObject var classes: ClassLocations
    @State private var showAlert = false
    
    var body: some View {
        
        if !self.classes.detail.isEmpty{
            
            ZStack {
                VStack {
                    Rectangle()
                        .frame(height: 10)
                        .foregroundColor(Color("SearchBarColor"))
                    HStack{
                        Button(action: {
                            classes.showRoute.toggle()
                        }){
                            VStack{
                                Image(systemName: "mappin.circle.fill")
                                    .padding(.top)
                                    .padding(.horizontal, 16)
                                    .scaleEffect(1.5)
                                    .scaledToFill()
                                    .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.1), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                                Text(classes.showRoute ? "Stop Navigation" : "Navigate")
                                    .padding(.all)
                                    .font(.system(.caption2, design: .rounded))
                            }
                            
                            .accentColor(self.classes.showRoute ? Color(#colorLiteral(red: 0.9176470588, green: 0.3450980392, blue: 0.3019607843, alpha: 1)) : Color(#colorLiteral(red: 0.4745098039, green: 0.768627451, blue: 0.5843137255, alpha: 1)))
                            .background(Color("ClassColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .frame(width:100)
                            
                        }
                        
                        Button(action: {
                            if classes.userClass.contains(classes.detail[0]){
                                classes.userClass = classes.userClass.filter{$0 != classes.detail[0]}
                                self.showAlert = true
                            } else{
                                classes.userClass.append(self.classes.detail[0])
                                self.showAlert = true
                            }
                        }){
                            VStack{
                                Image(systemName: "plus.circle.fill")
                                    .rotationEffect(classes.userClass.contains(classes.detail[0]) ? Angle(degrees: 45) : Angle(degrees: 0))
                                    .padding(.top)
                                    .padding(.horizontal, 16)
                                    .scaleEffect(1.5)
                                    .scaledToFill()
                                    .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.1), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                                Text(classes.userClass.contains(classes.detail[0]) ? "DROP" : "ADD")
                                    .padding(.all)
                                    .font(.system(.caption2, design: .rounded))
                            }
                            .accentColor(classes.userClass.contains(classes.detail[0]) ? Color(#colorLiteral(red: 0.9176470588, green: 0.3450980392, blue: 0.3019607843, alpha: 1)) : Color(#colorLiteral(red: 0.4745098039, green: 0.768627451, blue: 0.5843137255, alpha: 1)))
                            .background(Color("ClassColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .frame(width:100)
                        }
                        .alert(isPresented: $showAlert, content: {
                            Alert(title: Text(classes.userClass.contains(classes.detail[0]) ? "Class Added" : "Class Dropped"), message: Text(classes.userClass.contains(classes.detail[0]) ? "Class is added!" : "Class is dropped!"), dismissButton: .default(Text("Got it!")))
                        })
                        
                        
                    }
                    
                    if self.classes.detail[0].ClassLocation == [42.05780619999999,-87.67587739999999]{
                        Link("Tech Room too big? Use finder here!", destination: URL(string: "https://www.mccormick.northwestern.edu/contact/tech-room-finder.html")!)
                            .padding(.horizontal)
                            .padding(.top,15)
                            .accentColor(.white)
                            .background(Color(#colorLiteral(red: 0.4745098039, green: 0.768627451, blue: 0.5843137255, alpha: 1)))
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                    
                    VStack(alignment: .leading){
                        Text("Class Overview")
                            .fontWeight(.bold)
                            .padding(.all)
                            .foregroundColor((Color(#colorLiteral(red: 0.4745098039, green: 0.768627451, blue: 0.5843137255, alpha: 1))))
                            
                    }
                    
                    if !self.classes.detail.isEmpty{
                        ScrollView(showsIndicators: true){
                            Text(self.classes.detail[0].ClassOverview)
                                
                                .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
                                
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .background(Color("ClassColor"))
                        .frame(maxHeight: 200)
                        .cornerRadius(8)
                    }
                }
            }

        }
        
        
        
    }
}


