import SwiftUI

struct Screen: View {
    private let rectWidthDivConst = 0.95
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width * rectWidthDivConst, height: UIScreen.main.bounds.height / 3)
                    .cornerRadius(20)
                    .foregroundColor(.gray)
                    .coordinateSpace(name: "Rectangle")
            }
            .offset(x: UIScreen.main.bounds.width * ((1 - rectWidthDivConst) / 2))
        }
    }
}

struct MatrixDisplay: View {
    @ObservedObject private var matrixSize: MatrixSize
    @State private var nUpdated: Int = 3
    @State private var matrix: [[String]] = Array(repeating: Array(repeating: "", count: 3), count: 3)
    @State private var augment: [String] = Array(repeating: "", count: 3)
    
    private let textWidth: CGFloat = 30
    
    init(matrixSize: MatrixSize) {
        UIStepper.appearance().setDecrementImage(UIImage(systemName: "minus"), for: .normal)
        UIStepper.appearance().setIncrementImage(UIImage(systemName: "plus"), for: .normal)
        self.matrixSize = matrixSize
    }
        
    var body: some View {
        ZStack {
            VStack {
                ForEach(0..<nUpdated, id: \.self) { row in
                    HStack {
                        Spacer()
                        
                        ForEach(0..<nUpdated, id: \.self) { column in
                            TextField("", text: Binding(
                                get: { matrix[row][column] },
                                set: { matrix[row][column] = $0 }
                            ))
                            .background(Rectangle().fill(Color.pink).shadow(radius: 20))
                            .foregroundColor(.white)
                            .frame(width: textWidth, height: 20, alignment: .center)
                            .keyboardType(.numberPad)
                            .padding(.horizontal, 3)
                        }
                        
                        TextField("", text: Binding(
                            get: { augment[row] },
                            set: { augment[row] = $0 }
                        ))
                        .background(Rectangle().fill(Color.pink).shadow(radius: 20))
                        .foregroundColor(.white)
                        .frame(width: textWidth, height: 30, alignment: .center)
                        .keyboardType(.numberPad)
                        .padding(.horizontal, 30)
                        .padding(.vertical, -5)
                        
                        Spacer()
                    }
                }
            }
            .position(x: UIScreen.main.nativeBounds.width / 4, y: UIScreen.main.nativeBounds.height / 13.5)
            .onChange(of: matrixSize.n, updateAugmentedMatrix)
        }
        .padding()
    }
    
    private func updateAugmentedMatrix() {
        var updatedMatrix = Array(repeating: Array(repeating: "", count: matrixSize.n), count: matrixSize.n)
        var updatedAugment = Array(repeating: "", count: matrixSize.n)

        for r in 0..<min(matrixSize.n, matrix.count) {
            for c in 0..<min(matrixSize.n, matrix[r].count) {
                updatedMatrix[r][c] = matrix[r][c]
            }
        }
        
        for r in 0..<min(matrixSize.n, augment.count) {
            updatedAugment[r] = augment[r]
        }
        
        nUpdated = matrixSize.n
        matrix = updatedMatrix
        augment = updatedAugment
    }
}

#Preview {
    LoadingView()
}
