//
//  ButtonUI.swift
//  NumericalCMPT
//
//  Created by Rahul Ramjeawon on 11/25/23.
//

import SwiftUI

struct ButtonUI: View {
    @State private var enterButton = "Enter"
    @State private var number: Float = 0
    var body: some View {
        VStack(){
            HStack{
                Text("\(Int(number))")
                    .frame(maxWidth: .infinity, maxHeight: 6, alignment: .trailing)
                    .padding(10)
                    .font(.largeTitle)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .shadow(radius: 4)
            }//HStack ends here
            .padding(.bottom, 50)
            .padding(.top, 150)
    
            
            HStack() {
                Button(action: {
                    //do something
                        number=1
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 75, height: 75)
                        .shadow(radius: 20)
                        .overlay(
                            Text("1")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    //do something
                        number=2
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 75, height: 75)
                        .shadow(radius: 20)
                        .overlay(
                            Text("2")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    //do something
                        number=3
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 75, height: 75)
                        .shadow(radius: 20)
                        .overlay(
                            Text("3")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
            }//HStack ends here
            .padding(.top, 20)
            
            HStack() {
                Button(action: {
                    //do something
                        number=4
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 75, height: 75)
                        .shadow(radius: 20)
                        .overlay(
                            Text("4")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    //do something
                        number=5
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 75, height: 75)
                        .shadow(radius: 20)
                        .overlay(
                            Text("5")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    //do something
                        number=6
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 75, height: 75)
                        .shadow(radius: 20)
                        .overlay(
                            Text("6")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
            }//HStack ends here
            .padding(.top,1)
            
            HStack() {
                Button(action: {
                    //do something
                        number=7
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 75, height: 75)
                        .shadow(radius: 20)
                        .overlay(
                            Text("7")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    //do something
                        number=8
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 75, height: 75)
                        .shadow(radius: 20)
                        .overlay(
                            Text("8")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    //do something
                        number=9
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 75, height: 75)
                        .shadow(radius: 20)
                        .overlay(
                            Text("9")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
            }//HStack ends here
            .padding(.top,1)
            
            HStack() {
                Button(action: {
                    //do something

                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 75, height: 75)
                        .shadow(radius: 20)
                        .overlay(
                            Text(".")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    //do something
                        number=0
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 75, height: 75)
                        .shadow(radius: 20)
                        .overlay(
                            Text("0")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    //do something
                        
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 75, height: 75)
                        .shadow(radius: 20)
                        .overlay(
                            Text("-")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
            }//HStack ends here
            .padding(.top,1)
            
            HStack{
                Button(action: {
                    //do something
                    if enterButton == "Enter"{
                        enterButton = "Compute"
                    }
                    else if enterButton == "Compute"{
                        enterButton = "Enter"
                    }
                    
                }, label: {
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 250, height: 75)
                        .shadow(radius: 200)
                        .clipShape(Capsule())
                        .overlay(
                            Text("\(enterButton)")
                                .font(.largeTitle)
                                .fontWidth(.condensed)
                                .foregroundColor(Color(.white))
                        )
                    })
            }//HStack ends here
            .padding(.top)
            .padding(.bottom,2)
        }//VStack ends here
        .padding(.top, 5)
        .padding(.bottom, 40)
        
    }
}


#Preview {
    ButtonUI()
}
