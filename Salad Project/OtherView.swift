//
//  OtherView.swift
//  Salad Project
//
//  Created by Kevin Su on 26/9/2021.
//

import SwiftUI

struct OtherView: View {
    var body: some View {
        VStack{
            VStack{
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+20)
            
            .background(Color.black)
            .opacity(0.7)
//            Spacer()
//            Rectangle()
//                .frame(height: 20.0)
//                .background(Color.black)
//                .opacity(0.7)
        }.ignoresSafeArea()
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OtherView()
            OtherView()
        }
    }
}
