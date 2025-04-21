//
//  Coordinator.swift
//  MiniChallenge
//
//  Created by 제하맥 on 4/16/25.
//

import SwiftUI
import Observation

@Observable final class Coordinator{
    var route: [ViewType] = []
    
    init(){
        push(.main)
    }
    
    func push(_ viewPath: ViewType){
        route.append(viewPath)
        print("Success appending view")
        print("path :", viewPath)
    }
    
    func pop(){
        route.removeLast()
    }
    
    func popToRoot(){
        route.removeAll()
    }
}
