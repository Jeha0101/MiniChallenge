//
//  ChallengeListNavigationView.swift
//  MiniChallenge
//
//  Created by 제하맥 on 4/21/25.
//

import SwiftUI

struct ChallengeListNavigationView : View{
    var imageName : String
    var count : Int
    var title : String
    var colorInside : Color
    var colorStroke : Color
    
    var body : some View {
        VStack(){
            HStack(){
                Image(
                    systemName: imageName
                )
                .resizable()
                .frame(
                    width: 32,
                    height: 32
                )
                Spacer()
                Text(
                    "\(count)"
                )
                .font(
                    .system(
                        size : 32,
                        weight: .bold
                    )
                )
            }
            HStack{
                Text(
                    title
                )
                .font(
                    .basicFontRegular
                )
                Spacer()
            }
        }
        .padding(
            10
        )
        .background(
            colorInside
        )
        .cornerRadius(
            8
        )
        .overlay(
            RoundedRectangle(
                cornerRadius: 8
            )
            .stroke(
                colorStroke,
                lineWidth:1
            )
        )
    }
}
