import SwiftUI

class ComputeAugmentedMatrix: ObservableObject {
    @Published var augmentedMatrix: [[NSNumber]]
    @Published var result: [Double]
    
    init(augmentedMatrix: [[NSNumber]], result: [Double]) {
        self.augmentedMatrix = augmentedMatrix
        self.result = result
    }
}

struct MatrixDisplay: View {
    @ObservedObject var matrixDispVals: MatrixDisplayValues
    @StateObject var computeAugmentedMatrix = ComputeAugmentedMatrix(
        augmentedMatrix: Array(repeating: Array(repeating: 0 as NSNumber, count: 0), count: 0),
        result: Array(repeating: 0 as Double, count: 0))
    
    @State private var nUpdated: Int = 3
    @State private var enterButton = "Enter"
    @State var canCompute = false
    @State var showMatrixView = true
    @State  var methodchooser: Int = 1
            
    var body: some View {
        ZStack {
            VStack {
                if (showMatrixView) {
                    ForEach(0..<nUpdated, id: \.self) { row in
                        HStack {
                            Spacer()
                            
                            ForEach(0..<nUpdated + 1, id: \.self) { column in
                                if (column < nUpdated) {
                                    Text("\(matrixDispVals.matrix[row][column])")
                                        .foregroundColor(.black)
                                        .frame(width: 40, height: 40, alignment: .center)
                                        .padding(.horizontal, 1)
                                        .border(Color.black, width: 1)
                                        .overlay(Rectangle()
                                            .stroke(
                                                matrixDispVals.row == row
                                                ? matrixDispVals.col == column
                                                ? Color.black
                                                : Color.pink
                                                : Color.pink, lineWidth: 3)
                                        )
                                }
                                else {
                                    Text(matrixDispVals.augment[row])
                                        .foregroundColor(.black)
                                        .frame(width: 40, height: 40, alignment: .center)
                                        .padding(.horizontal, 1)
                                        .border(Color.black, width: 1)
                                        .overlay(
                                            Rectangle()
                                                .stroke(
                                                    matrixDispVals.row == row
                                                    ? matrixDispVals.col == column
                                                    ? Color.black
                                                    : Color.pink
                                                    : Color.pink, lineWidth: 3)
                                        )
                                        .padding(.horizontal, 30)
                                        .padding(.vertical, -5)
                                }
                            }
                            
                            Spacer()
                        }
                    }
                }
                else {
                    MatrixResultView(computeAugmentedMatrix: computeAugmentedMatrix)
                }
            }
            .position(x: UIScreen.main.nativeBounds.width / 6, y: UIScreen.main.nativeBounds.height / 13)
            .onChange(of: matrixDispVals.matrixSize) {
                updateMatrixSize()
                checkIfCanCompute()
            }
            .onChange(of: matrixDispVals.matrix, checkIfCanCompute)
            .onChange(of: matrixDispVals.augment, checkIfCanCompute)
            .onChange(of: matrixDispVals.resetProgram) {
                showMatrixView = true
                canCompute = false
            }
            
            HStack{
                Button(action: {
                        if matrixDispVals.operationType == "Gauss"{
                            if let resultDisplay = TestWrapper().solveMatrix(computeAugmentedMatrix.augmentedMatrix, withMethod: 1)  as? [Double] {
                                
                                self.matrixDispVals.number = Double(resultDisplay.first ?? 0)
                            }
                            else if matrixDispVals.operationType == "Gauss Jordan"{
                                if let resultDisplay = TestWrapper().solveMatrix(computeAugmentedMatrix.augmentedMatrix, withMethod: 2) as? [Double] {
                                    
                                    self.matrixDispVals.number = Double(resultDisplay.first ?? 0)
                                }
                            }
                        }
                        
                        if enterButton == "Enter" {
                            setMatrixToCompute()
                            
                            if matrixDispVals.operationType == "Gauss"{
                                methodchooser = 1 }
                            else {
                                methodchooser = 2
                            }
                        
                            // 'solveMatrix' returns an NSArray of NSNumbers
                            if let result = TestWrapper().solveMatrix(computeAugmentedMatrix.augmentedMatrix, withMethod: methodchooser) as? [Double] {
                                print("Result Array in swift: \(result)")
                                if !result.isEmpty {
                                    // print("This should be poppin up?")
                                    computeAugmentedMatrix.result = result
                                }
                                
                                self.matrixDispVals.number = Double(result.first ?? 0.0)
                                print(matrixDispVals.number)
                            } else {
                                print("Casting to [Double] failed")
                            }
                            
                            matrixDispVals.numberDisplay = "0"
                            matrixDispVals.number = 0
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
                .disabled(!canCompute)
            }//HStack ends here
            .position(x: UIScreen.main.nativeBounds.width / 6.5, y: UIScreen.main.nativeBounds.height / 3.2)

        }
        .padding()
    }
    
    private func updateMatrixSize() {
        nUpdated = matrixDispVals.matrixSize
    }
    
    private func checkIfCanCompute() {
        var matrixIsFull: Bool = false
        var augmentIsFull: Bool = false
        
        for r in 0..<matrixDispVals.matrixSize {
            for c in 0..<matrixDispVals.matrixSize {
                if (matrixDispVals.matrix[r][c].isEmpty) {
                    matrixIsFull = false
                    break;
                }
                else if (!matrixIsFull){
                    matrixIsFull = true
                }
            }
        }
        
        for r in 0..<matrixDispVals.matrixSize {
            if (matrixDispVals.augment[r].isEmpty) {
                augmentIsFull = false
                break;
            }
            else if (!augmentIsFull){
                augmentIsFull = true
            }
        }
        
        canCompute = matrixIsFull && augmentIsFull ? true : false
    }
    
    private func setMatrixToCompute() {
        computeAugmentedMatrix.augmentedMatrix = Array(repeating: Array(repeating: 0 as NSNumber, count: matrixDispVals.matrixSize + 1), count: matrixDispVals.matrixSize)
        
        for r in 0..<matrixDispVals.matrixSize {
            for c in 0..<matrixDispVals.matrixSize + 1 {
                if (c < matrixDispVals.matrixSize) {
                    let convertedVal = Double(matrixDispVals.matrix[r][c])! as NSNumber
                    
                    computeAugmentedMatrix.augmentedMatrix[r][c] = convertedVal
                }
                else {
                    let convertedVal = Double(matrixDispVals.augment[r])! as NSNumber
                    
                    computeAugmentedMatrix.augmentedMatrix[r][c] = convertedVal
                }
            }
        }
        
        showMatrixView = false
        canCompute = false
    }
}

#Preview {
    LoadingView()
}
