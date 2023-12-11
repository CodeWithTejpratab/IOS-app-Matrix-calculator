//
//  MatrixResultView.swift
//  NumericalCMPT
//
//  Created by Emil Thomas Levin on 12/10/23.
//

import SwiftUI


struct MatrixResultView: View {
    @ObservedObject var computeAugmentedMatrix: ComputeAugmentedMatrix

    // Helper function to calculate the maximum width needed based on matrix content
    private func matrixMaxWidth() -> CGFloat {
        let maxLength = computeAugmentedMatrix.augmentedMatrix.flatMap { $0 }
            .map { String(format: "%.2f", $0.doubleValue).count }
            .max() ?? 0
        return CGFloat(maxLength) * 8 // Decreased from 10 to 8 for a tighter fit
    }

    var body: some View {
        // Center VStack on the screen
        VStack(spacing: 10) {
            // Matrix display
            VStack(alignment: .leading, spacing: 3) {
                Text("Matrix").font(.headline)
                ForEach(0..<computeAugmentedMatrix.augmentedMatrix.count, id: \.self) { row in
                    HStack {
                        ForEach(0..<computeAugmentedMatrix.augmentedMatrix[row].count, id: \.self) { column in
                            Text(String(format: "%.2f", computeAugmentedMatrix.augmentedMatrix[row][column].doubleValue))
                                .font(.caption) // Smaller font size for the matrix
                                .frame(width: matrixMaxWidth(), alignment: .center)
                                .padding(.horizontal, 1) // Reduced horizontal padding
                        }
                    }
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 8)
            .background(Color.gray.opacity(0.1))
            .border(Color.gray, width: 1)
            .cornerRadius(5)

            // Result array display
            VStack(alignment: .leading, spacing: 5) {
                Text("Result").font(.headline)
                Text(computeAugmentedMatrix.result.map { String(format: "%.4f", $0) }.joined(separator: ", "))
                    .font(.headline) // Keep the result font larger for emphasis
                    .padding(.vertical, 5) // Reduced vertical padding
            }
            .padding(.horizontal, 8) // Reduced horizontal padding for the result container
            .background(Color.blue.opacity(0.1))
            .border(Color.blue, width: 3)
            .cornerRadius(6)
        }
        .position(x: UIScreen.main.nativeBounds.width / 7.15, y: UIScreen.main.nativeBounds.height / 21)
    }
}



//struct MatrixResultView_Previews: PreviewProvider {
//    static var previews: some View {
////        let matrix: [[NSNumber]] = [
////            [3, 1, -4, 7].map(NSNumber.init(value:)),
////            [-2, 3, 1, -5].map(NSNumber.init(value:)),
////            [2, 0, 5, 10].map(NSNumber.init(value:))
////        ]
////        if let result = TestWrapper().solveMatrix(matrix, withMethod: 1) as? [Double] {
////            if !result.isEmpty {
////                MatrixResultView(computeAugmentedMatrix.augmentedMatrix: matrix, result: result)
////                    .previewLayout(.sizeThatFits)
////            }
////            
////        }
//    }
//}

#Preview {
        LoadingView()
}
