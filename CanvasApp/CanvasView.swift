//
//  CanvasView.swift
//  CanvasApp
//
//  Created by A'zamjon Abdumuxtorov on 17/09/24.
//

import SwiftUI

struct CanvasView: View {
    
    @State private var verticalOffset: CGSize = .zero
    @State private var horizontalOffset: CGSize = .zero
    @State private var showVerticalLine = false
    @State private var showHorizontalLine = false
    
    let rectangleSize: CGFloat = 350
    
    var body: some View {
        VStack{
            HStack(spacing:40){
                
                Rectangle()
                    .frame(width: 10, height: 80)
                    .foregroundColor(.blue)
                    .offset(x: verticalOffset.width, y: verticalOffset.height) // Pozitsiyani qo'llash
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                self.verticalOffset = value.translation // Tortish orqali pozitsiyani o'zgartirish
                            }
                            .onEnded { _ in
                                // Kvadratning ichida ekanligini tekshirish
                                if abs(self.verticalOffset.height) > rectangleSize*0.5 &&  abs(self.verticalOffset.height) < rectangleSize*1.5{
                                    // Vertikal chiziqni ko'rsatish
                                    self.showVerticalLine = true
                                }
                                // O'z joyiga qaytish
                                withAnimation {
                                    self.verticalOffset = .zero
                                }
                            }
                    )
                
                Rectangle()
                    .frame(width: 80, height: 10)
                    .foregroundColor(.blue)
                    .offset(x: horizontalOffset.width, y: horizontalOffset.height) // Pozitsiyani qo'llash
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                self.horizontalOffset = value.translation // Tortish orqali pozitsiyani o'zgartirish
                            }
                            .onEnded { _ in
                                // Kvadratning ichida ekanligini tekshirish
                                if  abs(self.horizontalOffset.height) > rectangleSize*0.5 && abs(self.horizontalOffset.height) < rectangleSize*1.5 {
                                    // Gorizontal chiziqni ko'rsatish
                                    self.showHorizontalLine = true
                                }
                                // O'z joyiga qaytish
                                withAnimation {
                                    self.horizontalOffset = .zero
                                }
                            }
                    )
            }
            .foregroundColor(.blue)
            .padding(.top)
            
            Spacer()
            ZStack {
                Rectangle()
                    .stroke(.blue, lineWidth: 10)
                    .frame(width: 350, height: 350)
                
                // Vertikal chiziq
                if showVerticalLine {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 10, height: 350)
                }
                
                // Gorizontal chiziq
                if showHorizontalLine {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 350, height: 10)
                }
            }
            Spacer()
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.gray.opacity(0.3))
    }
    
   
}

#Preview {
    CanvasView()
}
