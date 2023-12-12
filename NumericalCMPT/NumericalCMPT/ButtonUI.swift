//
//  ButtonUI.swift
//  NumericalCMPT
//
//  Created by Rahul Ramjeawon on 11/25/23.
//

import SwiftUI
import Foundation

class MatrixDisplayValues: ObservableObject {
    @Published var matrixSize: Int
    @Published var operationType: String
    @Published var number: Double
    @Published var numberDisplay: String
    @Published var row: Int
    @Published var col: Int
    @Published var matrix: [[String]]
    @Published var augment: [String]
    @Published var resetProgram: Int
    
    init(matrixSize: Int, operationType: String, number: Double, numberDisplay: String, row: Int, col: Int, matrix: [[String]], augment: [String], resetProgram: Int) {
        self.matrixSize = matrixSize
        self.operationType = operationType
        self.number = number
        self.numberDisplay = numberDisplay
        self.row = row
        self.col = col
        self.matrix = matrix
        self.augment = augment
        self.resetProgram = resetProgram
    }
}

struct ButtonUI: View {
    @StateObject private var matrixDispVals = MatrixDisplayValues(
        matrixSize: 3,
        operationType: "Gauss",
        number: 0,
        numberDisplay: "",
        row: 0,
        col: 0,
        matrix: Array(repeating: Array(repeating: "", count: 5), count: 5),
        augment: Array(repeating: "", count: 5),
        resetProgram: 0)
    
    @State private var enterButton = "Enter"
    @State private var didTap: Bool = false
    @State private var checkinput: String = "AL"
    @State private var number1: Double = 0 // test var
    @State private var number2: Double = 0 // test var
    @State private var arrowWasClicked: Bool = false
    @State private var isDecimal: Bool = false
    @State private var disableNumButtons: Bool = false
    // this string helps concatinate numbers you can display 12
    var body: some View {
        VStack(spacing: 8){
            MatrixDisplay(matrixDispVals: matrixDispVals)

            HStack{
                Text(matrixDispVals.numberDisplay.isEmpty ? "0" : matrixDispVals.numberDisplay)
                //Text("\(Int(matrixDispVals.number))")
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
                    matrixDispVals.operationType = (matrixDispVals.operationType == "Gauss") ? "Gauss Jordan" : "Gauss"
                }, label: {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 115, height: 60)
                        .shadow(radius: 150)
                        .clipShape(Capsule())
                        .overlay(
                            Text(matrixDispVals.operationType)
                                .foregroundColor(Color(.white))
                        )
                }
                )
                Button(action: {
                    //do something
                    matrixDispVals.matrixSize=2
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
                    matrixDispVals.matrixSize=3
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
                    matrixDispVals.matrixSize=4
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
                    matrixDispVals.matrixSize=5
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
                    matrixDispVals.numberDisplay += "1"
                    matrixDispVals.number = Double(matrixDispVals.numberDisplay) ?? 0
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
                .disabled(disableNumButtons)

                Button(action: {
                    //do something
                    checkinput = "C"
                    matrixDispVals.numberDisplay += "2"
                    matrixDispVals.number = Double(matrixDispVals.numberDisplay) ?? 0
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
                .disabled(disableNumButtons)

                Button(action: {
                    //do something
                    checkinput = "C"
                    matrixDispVals.numberDisplay += "3"
                    matrixDispVals.number = Double(matrixDispVals.numberDisplay) ?? 0
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
                .disabled(disableNumButtons)

                ZStack {
                
                    VStack{
                        Button(action: {
                            matrixDispVals.row -= 1
                            
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
                                matrixDispVals.col -= 1
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
                                matrixDispVals.col += 1
                                
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
                            matrixDispVals.row += 1
                           
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
                .onChange(of: matrixDispVals.row) {
                    changeRowColIndex()
                }
                .onChange(of: matrixDispVals.col) {
                    changeRowColIndex()
                }
            }//HStack ends here
            
            HStack() {
                Button(action: {
                    //do something
                    checkinput = "C"
                    matrixDispVals.numberDisplay += "4"
                    matrixDispVals.number = Double(matrixDispVals.numberDisplay) ?? 0
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
                .disabled(disableNumButtons)

                Button(action: {
                    //do something
                    checkinput = "C"
                    matrixDispVals.numberDisplay += "5"
                    matrixDispVals.number = Double(matrixDispVals.numberDisplay) ?? 0
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
                .disabled(disableNumButtons)

                Button(action: {
                    //do something
                    checkinput = "C"
                    matrixDispVals.numberDisplay += "6"
                    matrixDispVals.number = Double(matrixDispVals.numberDisplay) ?? 0
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
                .disabled(disableNumButtons)

                Button(action: {
                    //do something
                    matrixDispVals.numberDisplay=""
                    matrixDispVals.number=0
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
                    matrixDispVals.numberDisplay += "7"
                    matrixDispVals.number = Double(matrixDispVals.numberDisplay) ?? 0
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
                .disabled(disableNumButtons)

                Button(action: {
                    //do something
                    checkinput = "C"
                    matrixDispVals.numberDisplay += "8"
                    matrixDispVals.number = Double(matrixDispVals.numberDisplay) ?? 0
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
                .disabled(disableNumButtons)

                Button(action: {
                    //do something
                    checkinput = "C"
                    matrixDispVals.numberDisplay += "9"
                    matrixDispVals.number = Double(matrixDispVals.numberDisplay) ?? 0
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
                .disabled(disableNumButtons)

                Button(action: {
                    if (!matrixDispVals.numberDisplay.isEmpty && matrixDispVals.numberDisplay.count > 1) {
                        matrixDispVals.numberDisplay.removeLast()
                        matrixDispVals.number = Double(matrixDispVals.numberDisplay) ?? 0
                    }
                    else {
                        matrixDispVals.numberDisplay = ""
                    }
                    
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 70, height: 65)
                        .shadow(radius: 10)
                        .overlay(
                            Text("Del")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
            }//HStack ends here
    
            
            HStack() {
                Button(action: {
                    if (!isDecimal && !matrixDispVals.numberDisplay.isEmpty) {
                        matrixDispVals.numberDisplay += "."
                        matrixDispVals.number = Double(matrixDispVals.numberDisplay) ?? 0
                    }
                    
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
                .disabled(isDecimal)
                .disabled(disableNumButtons)

                Button(action: {
                    if (matrixDispVals.numberDisplay != "0") {
                        matrixDispVals.numberDisplay += "0"
                        matrixDispVals.number = Double(matrixDispVals.numberDisplay) ?? 0
                    }
                    else {
                        matrixDispVals.numberDisplay = ""
                    }
                    
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
                .disabled(disableNumButtons)
                Button(action: {
                    if (matrixDispVals.number != 0) {
                        matrixDispVals.number *= -1
                        matrixDispVals.numberDisplay = formatNumberForDisplay(matrixDispVals.number)
                    }
                        
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
                    matrixDispVals.row = 0
                    matrixDispVals.col = 0
                    matrixDispVals.matrix = Array(repeating: Array(repeating: "", count: 5), count: 5)
                    matrixDispVals.augment = Array(repeating: "", count: 5)
                    matrixDispVals.numberDisplay = "0"
                    arrowWasClicked = true
                    matrixDispVals.resetProgram += 1
                        
                }, label: {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 70, height: 65)
                        .shadow(radius: 10)
                        .overlay(
                            Text("New")
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        )
                    })
            }//HStack ends here
        }//VStack ends here
        .position(x: UIScreen.main.nativeBounds.width / 6, y: UIScreen.main.nativeBounds.height / 8.4)
        .onChange(of: matrixDispVals.numberDisplay) {
            setMatrixValues()
            
            isDecimal = matrixDispVals.numberDisplay.contains(".") ? true : false
            
            let numberNoDecimal = matrixDispVals.numberDisplay.replacingOccurrences(of: ".", with: "")
            if (numberNoDecimal.count > 8) {
                disableNumButtons = true
            }
            else {
                disableNumButtons = false
            }
        }
        .onChange(of: matrixDispVals.matrixSize, changeRowColIndex)
    }
    
    private func setMatrixValues() {
        if (matrixDispVals.numberDisplay.hasPrefix("0") && matrixDispVals.numberDisplay.count > 1) {
            matrixDispVals.numberDisplay.removeFirst()
        }
        
        if (!matrixDispVals.numberDisplay.isEmpty && !arrowWasClicked) {
            //matrixDispVals.number = Double(matrixDispVals.numberDisplay)
            
            if (matrixDispVals.col < matrixDispVals.matrixSize) {
                matrixDispVals.matrix[matrixDispVals.row][matrixDispVals.col] = matrixDispVals.numberDisplay
            }
            else {
                matrixDispVals.augment[matrixDispVals.row] = matrixDispVals.numberDisplay
            }
        }
        else {
            matrixDispVals.numberDisplay = ""
            matrixDispVals.number = 0
            
            if (matrixDispVals.col < matrixDispVals.matrixSize) {
                matrixDispVals.matrix[matrixDispVals.row][matrixDispVals.col] = ""
            }
            else {
                matrixDispVals.augment[matrixDispVals.row] = ""
            }
            
            arrowWasClicked = false
        }
    }
    
    private func changeNumberToMatrixValue() {
        if (matrixDispVals.col < matrixDispVals.matrixSize) {
            matrixDispVals.numberDisplay = matrixDispVals.matrix[matrixDispVals.row][matrixDispVals.col]
            
            if (matrixDispVals.matrix[matrixDispVals.row][matrixDispVals.col].isEmpty) {
                arrowWasClicked = true
            }
            else {
                arrowWasClicked = false
            }
        }
        else {
            matrixDispVals.numberDisplay = matrixDispVals.augment[matrixDispVals.row]
            
            if (matrixDispVals.augment[matrixDispVals.row].isEmpty) {
                arrowWasClicked = true
            }
            else {
                arrowWasClicked = false
            }
        }
    }
    
    private func changeRowColIndex() {
        if (matrixDispVals.row < 0) {
            matrixDispVals.row = 0
        }
        else if (matrixDispVals.row > matrixDispVals.matrixSize - 1) {
            matrixDispVals.row = matrixDispVals.matrixSize - 1
        }
        
        if (matrixDispVals.col < 0) {
            matrixDispVals.col = 0
        }
        else if (matrixDispVals.col > matrixDispVals.matrixSize) {
            matrixDispVals.col = matrixDispVals.matrixSize
        }
        
        changeNumberToMatrixValue()
    }
    
    private func formatNumberForDisplay(_ number: Double) -> String {
        if number.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", number)
        } 
        else {
            return String(format: "%.8f", number)
        }
    }
}


#Preview {
    ButtonUI()
}
