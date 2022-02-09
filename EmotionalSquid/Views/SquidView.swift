//
//  SquidView.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 2/7/22.
//

import SwiftUI

struct SquidView: View {
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                ZStack {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.secondary)
                    Image(systemName: "person.2.fill")
                        .resizable()
                        .frame(width: 25, height: 20)
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 20)
                }
                Spacer()
                ZStack {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.secondary)
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 20)
                }
                
            }
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<10) {
                        Text("Squid \($0)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(width: 200, height: 200)
                            .background(Color.red)
                    }
                }
            }
            Spacer().frame(height: 75)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<10) {_ in
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.teal)
                    }
                }
            }
            Spacer()
            Text("Store")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.pink)
                .multilineTextAlignment(.center)
            
            
            Image(systemName: "arrow.down")
                .renderingMode(.original)
                .resizable()
                .foregroundColor(Color.gray)
                .frame(width: 30.0, height: 30.0)
        }
    }
}

struct SquidView_Previews: PreviewProvider {
    static var previews: some View {
        SquidView()
    }
}
