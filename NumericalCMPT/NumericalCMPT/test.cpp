//
//  test.cpp
//  NumericalCMPT
//
//  Created by Emil Thomas Levin on 12/7/23.
//

#include "test.hpp"
#include <iostream>
#include <vector>

using namespace std;

vector<double> gauss(vector<vector<double>>& matrix);
vector<double> gaussJordan(vector<vector<double>>& matrix);
vector<double> chooseMethodAndSolve(vector<vector<double>>& matrix, int method);


vector<double> gauss(vector<vector<double>>& matrix) {
    std::vector<vector<double>>::size_type n = matrix.size();
        vector<double> x(n);
    for (int i = 0; i < n; i++) {
        // Search for maximum in this column
        double maxEl = abs(matrix[i][i]);
        int maxRow = i;
        for (int k = i + 1; k < n; k++) {
            if (abs(matrix[k][i]) > maxEl) {
                maxEl = abs(matrix[k][i]);
                maxRow = k;
            }
        }

        // Swap maximum row with current row (column by column)
        for (int k = i; k < n + 1; k++) {
            swap(matrix[maxRow][k], matrix[i][k]);
        }

        // Make all rows below this one 0 in current column
        for (int k = i + 1; k < n; k++) {
            double c = -matrix[k][i] / matrix[i][i];
            for (int j = i; j < n + 1; j++) {
                if (i == j) {
                    matrix[k][j] = 0;
                } else {
                    matrix[k][j] += c * matrix[i][j];
                }
            }
        }
    }

    // Solve equation Ax=b for an upper triangular matrix A
    for (std::vector<vector<double>>::size_type i = n; i-- > 0; ) {
            x[i] = matrix[i][n] / matrix[i][i];
            for (std::vector<vector<double>>::size_type k = i; k-- > 0; ) {
                matrix[k][n] -= matrix[k][i] * x[i];
        }
    }

    return x;
}

vector<double> gaussJordan(vector<vector<double>>& matrix) {
    std::vector<vector<double>>::size_type n = matrix.size();
        vector<double> x(n);
    for (int i = 0; i < n; i++) {
        // Search for maximum in this column
        double maxEl = abs(matrix[i][i]);
        int maxRow = i;
        for (int k = i + 1; k < n; k++) {
            if (abs(matrix[k][i]) > maxEl) {
                maxEl = abs(matrix[k][i]);
                maxRow = k;
            }
        }

        // Swap maximum row with current row (column by column)
        for (int k = i; k < n + 1; k++) {
            swap(matrix[maxRow][k], matrix[i][k]);
        }

        // Make all rows below this one 0 in current column
        for (int k = 0; k < n; k++) {
            if (k != i) {
                double c = -matrix[k][i] / matrix[i][i];
                for (int j = i; j < n + 1; j++) {
                    if (i == j) {
                        matrix[k][j] = 0;
                    } else {
                        matrix[k][j] += c * matrix[i][j];
                    }
                }
            }
        }
    }

    // Fill solution vector
    for (int i = 0; i < n; i++) {
        x[i] = matrix[i][n] / matrix[i][i];
        //cout << x[i] << endl;
    }

    return x;
}

vector<double> chooseMethodAndSolve(vector<vector<double>>& matrix, int method) {
    cout << "method: " << method << endl;
    if (method == 1) {
        cout << "Gauss Result: " << endl;
        return gauss(matrix);
    } else if (method == 2) {
        cout << "Gauss-Jordan Result: " << endl;
        return gaussJordan(matrix);
    } else {
        cout << "Invalid method choice. Exiting program." << endl;
        //cout << "Did it trigger?" << endl;
        return vector<double>(); // Return an empty vector in case of invalid choice
    }
}


