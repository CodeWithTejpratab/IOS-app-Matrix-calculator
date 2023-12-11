//
//  ButtonUI.swift
//  NumericalCMPT
//
//  Created by Rahul Ramjeawon on 11/25/23.
//

import SwiftUI
import Foundation


struct ButtonUI: View {
    @State private var enterButton = "Enter"
    @State private var number: Float = 0
    @State private var didTap: Bool = false
    @State private var checkinput: String = "AL"
    @State private var numberDisplay: String = ""
    @State private var operationType = "gauss"
    @State private var matrixSize: Int = 2
    @State private var number1: Double = 0 // test var
    @State private var number2: Double = 0 // test var
    // this string helps concatinate numbers you can display 12
    var body: some View {
        VStack(spacing: 8){
            Spacer()
            HStack{
                
                Text("\(Int(number))")
                    .frame(maxWidth: .infinity, maxHeight: 6, alignment: .trailing)
                    .padding(10)
                    .font(.largeTitle)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .shadow(radius: 4)
            }//HStack ends here
            Spacer()
            
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
                    //do something
                    matrixSize=2
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
                    //do something
                    matrixSize=3
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
                    //do something
                    matrixSize=4
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
                    //do something
                    matrixSize=5
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
                ZStack {
                
                    VStack{
                        Button(action: {
                            //do something
                            
                        }, label: {
                            Rectangle()
                                .fill(Color.pink)
                                .shadow(radius: 10)
                                .clipShape(Capsule())
                                .overlay(
                                    Image(systemName: "arrowshape.up")
                                        .font(.title)
                                        .foregroundColor(Color(.white))
                                )
                                .frame(width: 20, height: 26)
                        })
                    }
                    .padding(.bottom,50)
                        HStack{
                            Button(action: {
                                //do something
                                
                            }, label: {
                                Rectangle()
                                    .fill(Color.pink)
                                    .frame(width: 30, height: 20)
                                    .shadow(radius: 10)
                                    .clipShape(Capsule())
                                    .overlay(
                                        Image(systemName: "arrowshape.left")
                                            .font(.title)
                                            .foregroundColor(Color(.white))
                                    )
                            })
                            Button(action: {
                                //do something
                                
                            }, label: {
                                Rectangle()
                                    .fill(Color.pink)
                                    .frame(width: 30, height: 20)
                                    .shadow(radius: 10)
                                    .clipShape(Capsule())
                                    .overlay(
                                        Image(systemName: "arrowshape.right")
                                            .font(.title)
                                            .foregroundColor(Color(.white))
                                    )
                            })
                        }//HStack ends here
                    
                    VStack {
                        Button(action: {
                                //do something
                           
                            }, label: {
                                Rectangle()
                                    .fill(Color.pink)
                                    .frame(width: 20, height: 26)
                                    .shadow(radius: 10)
                                    .clipShape(Capsule())
                                    .overlay(
                                        Image(systemName: "arrowshape.down")
                                            .font(.title)
                                            .foregroundColor(Color(.white))
                                    )
                        })
                    }
                    .padding(.top,50)
                    
                   // }//VStack ends here
                }//ZStack ends here
            }//HStack ends here
            
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
            
            
            HStack{
                Button(action: {
                    //do something
                    let matrix: [[NSNumber]] = [
                        [3, 1, -4, 7],
                        [-2, 3, 1, -5],
                        [2, 0, 5, 10]
                    ]
                    
                    if operationType == "gauss"{
                        if let resultDisplay = TestWrapper().solveMatrix(matrix, withMethod: 1)  as? [Double]{
                            
                            self.number = Float(resultDisplay.first ?? 0)
                        }
                        else if operationType == "gaussJordan"{
                            if let resultDisplay = TestWrapper().solveMatrix(matrix, withMethod: 2)  as? [Double]{
                                
                                self.number = Float(resultDisplay.first ?? 0)
                            }
                        }
                    }
                    
                    if enterButton == "Enter"{

                            // 'solveMatrix' returns an NSArray of NSNumbers
                            if let result = TestWrapper().solveMatrix(matrix, withMethod: 1) as? [Double] {
                                print("Result Array in swift: \(result)")
                                if !result.isEmpty {
                                    print("This should be poppin up?")
                                    MatrixResultView(matrix: matrix, result: result)
                                        .padding()
                                }
                                self.number = Float(result.first ?? 0.0)
                                print(number)
                            } else {
                                print("Casting to [Double] failed")
                            }



                        
                            numberDisplay = "0"
                            number = 0
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
            
        }//VStack ends here
        
    }
}


#Preview {
    ButtonUI()
}
