//
//  MatrixResultView.swift
//  NumericalCMPT
//
//  Created by Emil Thomas Levin on 12/10/23.
//

import SwiftUI


struct MatrixResultView: View {
    let matrix: [[NSNumber]]
    let result: [Double]

    // Helper function to calculate the maximum width needed based on matrix content
    private func matrixMaxWidth() -> CGFloat {
        let maxLength = matrix.flatMap { $0 }
            .map { String(format: "%.2f", $0.doubleValue).count }
            .max() ?? 0
        return CGFloat(maxLength) * 8 
    }

    var body: some View {
        GeometryReader { geometry in
            HStack {
                // Matrix display on the left
                VStack(alignment: .leading, spacing: 3) {
                    Text("Matrix").font(.headline)
                    ForEach(0..<matrix.count, id: \.self) { row in
                        HStack {
                            ForEach(0..<matrix[row].count, id: \.self) { column in
                                Text(String(format: "%.2f", matrix[row][column].doubleValue))
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

                Spacer()

                // Result array display on the right
                VStack {
                    Text("Result").font(.headline)
                    ForEach(0..<result.count, id: \.self) { index in
                        Text(String(format: "%.2f", result[index]))
                            .font(.headline) // Keep the result font larger for emphasis
                            .padding(.vertical, 5) // Reduced vertical padding
                    }
                }
                .padding(.horizontal, 8) // Reduced horizontal padding for the result container
                .background(Color.blue.opacity(0.1))
                .border(Color.blue, width: 3)
                .cornerRadius(6)
                .frame(minWidth: 100, maxWidth: geometry.size.width / 3.5)
            }
            .frame(height: geometry.size.height / 2) // Only occupy the top half of the screen
            .padding(.horizontal) // Padding on the horizontal edges to ensure it doesn't touch the screen edges
        }
    }
}


struct MatrixResultView_Previews: PreviewProvider {
    static var previews: some View {
        let matrix: [[NSNumber]] = [
            [3, 1, -4, 7].map(NSNumber.init(value:)),
            [-2, 3, 1, -5].map(NSNumber.init(value:)),
            [2, 0, 5, 10].map(NSNumber.init(value:))
        ]
        if let result = TestWrapper().solveMatrix(matrix, withMethod: 1) as? [Double] {
            if !result.isEmpty {
                MatrixResultView(matrix: matrix, result: result)
                    .previewLayout(.sizeThatFits)
            }
            
        }
    }
}
