//
//  ContentView.swift
//  SleepyzHead
//
//  Created by Shinjan Patra on 18/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isCardVisible = false

    var body: some View {
        ZStack {
            // Main Content
            VStack {
                Spacer()
                // Your existing content here
            }

            // Calendar Card
            GeometryReader { geometry in
                VStack {
                    Spacer()

                    Button(action: {
                        withAnimation {
                            isCardVisible.toggle()
                        }
                    }) {
                        Image(systemName: "chevron.up")
                            .font(.title)
                            .padding()
                            .background(Color.pink)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                    .padding(.bottom, 20)

                    if isCardVisible {
                        CalendarView()
                            .frame(height: geometry.size.height * 0.7) // Adjust the height as needed
                            .background(Color.black) // Set the background color to red
                            .cornerRadius(30)
                            .transition(.move(edge: .bottom))
                    }
                }
                
                .frame(maxWidth: .infinity)
                .background(Color.clear)
                .edgesIgnoringSafeArea(.bottom)
                
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

