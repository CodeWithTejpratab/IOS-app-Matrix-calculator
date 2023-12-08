//
//  ButtonUI.swift
//  NumericalCMPT
//
//  Created by Rahul Ramjeawon on 11/25/23.
//

import SwiftUI

class MatrixSize: ObservableObject {
    @Published var n: Int = 3
    
    init(n: Int) {
        self.n = 3
    }
}

struct ButtonUI: View {
    @State private var enterButton = "Enter"
    @State private var number: Float = 0
    @State private var didTap: Bool = false
    @State private var checkinput: String = "AL"
    @State private var numberDisplay: String = ""
    @State private var operationType = "gauss"
    @StateObject private var matrixSize = MatrixSize(n: 3)
    // this string helps concatinate numbers you can display 12
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
            
            HStack{
                Button(action: {
                    operationType = (operationType == "gauss") ? "gaussJordan" : "gauss"
                }, label: {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 115, height: 60)
                        .shadow(radius: 150)
                        .clipShape(Capsule())
                        .overlay(
                            Text(operationType)
                                .foregroundColor(Color(.white))
                        )
                }
                )
                Button(action: {
                    matrixSize.n = 2
                }, label: {
                    Rectangle()
                        .fill(Color.pink)
                        .frame(width: 60, height: 60)
                        .shadow(radius: 10)
                        .overlay(
                            Text("2")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    matrixSize.n = 3
                }, label: {
                    Rectangle()
                        .fill(Color.pink)
                        .frame(width: 60, height: 60)
                        .shadow(radius: 10)
                        .overlay(
                            Text("3")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    matrixSize.n = 4
                }, label: {
                    Rectangle()
                        .fill(Color.pink)
                        .frame(width: 60, height: 60)
                        .shadow(radius: 10)
                        .overlay(
                            Text("4")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    matrixSize.n = 5
                }, label: {
                    Rectangle()
                        .fill(Color.pink)
                        .frame(width: 60, height: 60)
                        .shadow(radius: 10)
                        .overlay(
                            Text("5")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                
                
            }
            .padding(.bottom, -40)
            .padding(.top, -40)
    
            
            HStack() {
                Button(action: {
                    //do something
                    checkinput = "C"
                    numberDisplay += "1"
                    number = Float(numberDisplay) ?? 0
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 70, height: 65)
                        .shadow(radius: 10)
                        .overlay(
                            Text("1")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    //do something
                    checkinput = "C"
                    numberDisplay += "2"
                    number = Float(numberDisplay) ?? 0
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 70, height: 65)
                        .shadow(radius: 10)
                        .overlay(
                            Text("2")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    //do something
                    checkinput = "C"
                    numberDisplay += "3"
                    number = Float(numberDisplay) ?? 0
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 70, height: 65)
                        .shadow(radius: 10)
                        .overlay(
                            Text("3")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                VStack{
                    Button(action: {
                        //do something
                        
                    }, label: {
                        Rectangle()
                            .fill(Color.pink)
                            .frame(width: 50, height: 30)
                            .shadow(radius: 10)
                            .clipShape(Capsule())
                            .overlay(
                                Image(systemName: "arrowshape.up")
                                    .font(.largeTitle)
                                    .foregroundColor(Color(.white))
                            )
                    })
                    HStack{
                        Button(action: {
                            //do something
                            
                        }, label: {
                            Rectangle()
                                .fill(Color.pink)
                                .frame(width: 30, height: 50)
                                .shadow(radius: 10)
                                .clipShape(Capsule())
                                .overlay(
                                    Image(systemName: "arrowshape.left")
                                        .font(.largeTitle)
                                        .foregroundColor(Color(.white))
                                )
                        })
                        Button(action: {
                            //do something
                            
                        }, label: {
                            Rectangle()
                                .fill(Color.pink)
                                .frame(width: 30, height: 50)
                                .shadow(radius: 10)
                                .clipShape(Capsule())
                                .overlay(
                                    Image(systemName: "arrowshape.right")
                                        .font(.largeTitle)
                                        .foregroundColor(Color(.white))
                                )
                        })
                    }//HStack ends here
                    Button(action: {
                        //do something
                   
                    }, label: {
                        Rectangle()
                            .fill(Color.pink)
                            .frame(width: 50, height: 30)
                            .shadow(radius: 10)
                            .clipShape(Capsule())
                            .overlay(
                                Image(systemName: "arrowshape.down")
                                    .font(.largeTitle)
                                    .foregroundColor(Color(.white))
                            )
                    })
                }//VStack ends here
            }//HStack ends here
            .padding(.top, 20)
            
            HStack() {
                Button(action: {
                    //do something
                    checkinput = "C"
                    numberDisplay += "4"
                    number = Float(numberDisplay) ?? 0
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 70, height: 65)
                        .shadow(radius: 10)
                        .overlay(
                            Text("4")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    //do something
                    checkinput = "C"
                    numberDisplay += "5"
                    number = Float(numberDisplay) ?? 0
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 70, height: 65)
                        .shadow(radius: 10)
                        .overlay(
                            Text("5")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    //do something
                    checkinput = "C"
                    numberDisplay += "6"
                    number = Float(numberDisplay) ?? 0
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 70, height: 65)
                        .shadow(radius: 10)
                        .overlay(
                            Text("6")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    //do something
                    numberDisplay="0"
                    number=0
                    checkinput = "AL"
                      
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 70, height: 65)
                        .shadow(radius: 10)
                        .overlay(
                            Text("\(checkinput)")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
            }//HStack ends here
            .padding(.top,1)
            
            HStack() {
                Button(action: {
                    //do something
                    checkinput = "C"
                    numberDisplay += "7"
                    number = Float(numberDisplay) ?? 0
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 70, height: 65)
                        .shadow(radius: 10)
                        .overlay(
                            Text("7")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    //do something
                    checkinput = "C"
                    numberDisplay += "8"
                    number = Float(numberDisplay) ?? 0
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 70, height: 65)
                        .shadow(radius: 10)
                        .overlay(
                            Text("8")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    //do something
                    checkinput = "C"
                    numberDisplay += "9"
                    number = Float(numberDisplay) ?? 0
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 70, height: 65)
                        .shadow(radius: 10)
                        .overlay(
                            Text("9")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    if !numberDisplay.isEmpty {
                        numberDisplay.removeLast()
                        number = Float(numberDisplay) ?? 0
                    }
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 70, height: 65)
                        .shadow(radius: 10)
                        .overlay(
                            Text("del")
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
                        .frame(width: 70, height: 65)
                        .shadow(radius: 10)
                        .overlay(
                            Text(".")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    //do something
                    numberDisplay += "0"
                    number = Float(numberDisplay) ?? 0
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 70, height: 65)
                        .shadow(radius: 10)
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
                        .frame(width: 70, height: 65)
                        .shadow(radius: 10)
                        .overlay(
                            Text("-")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
                Button(action: {
                    //do something
                        
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 70, height: 65)
                        .shadow(radius: 10)
                        .overlay(
                            Text("new")
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
                        numberDisplay = "0"
                        number = 0
                    }
                    else if enterButton == "Compute"{
                        enterButton = "Enter"
                    }
                    
                }, label: {
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 250, height: 65)
                        .shadow(radius: 200)
                        .clipShape(Capsule())
                        .overlay(
                            Text("\(enterButton)")
                                .font(.largeTitle)
                                .fontWidth(.condensed)
                                .foregroundColor(Color(.white))
                        )
                }).gesture(LongPressGesture(minimumDuration: 0.5).onEnded { _ in
                    if enterButton == "Enter" {
                            enterButton = "Compute"
                        } else if enterButton == "Compute" {
                            enterButton = "Enter"
                        }
                }) // I was experimenting with this so feel free to change it
            }//HStack ends here
            .padding(.top)
            .padding(.bottom,2)
        }//VStack ends here
        .padding(.top, 5)
        .padding(.bottom, 40)
        
        MatrixDisplay(matrixSize: matrixSize)
    }
}


#Preview {
    ButtonUI()
}
