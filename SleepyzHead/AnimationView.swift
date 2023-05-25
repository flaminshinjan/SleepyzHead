//
//  AnimationView.swift
//  SleepyzHead
//
//  Created by Shinjan Patra on 25/05/23.
//

import SwiftUI
import RiveRuntime
struct AnimationView: View {
var body: some View {
    ZStack{
        Color.black.ignoresSafeArea()
        RiveViewModel(fileName:"loading_dots")
            .view()
            .ignoresSafeArea()
    }
  }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
