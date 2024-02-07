# Implementing Lifting scheme for DWT

Lifting scheme is an efficient implementation method of the wavelet transform algorithm, and results in lossless data compression.
It consists of three basic steps:Split, Predict, and Update.

Split: Split the signal into two disjoint subsets of samples. Divide the signal X[n] into even and odd components:
Xe[n] and Xo[n], where Xe[n] = X[2n] and Xo[n] = X[2n + 1].

 Predict: Generate the detail signals d[n] as the prediction error using a prediction operator P: d[n] = X_0[n] - P(X_e[n]).

 Update: Generate the coarser (approximated) signals c[n] by applying an update operator U to d[n] and adding the result to Xe[n]:
c[n] = X_e[n] + U(d[n]).

To implement one level of DWT using the lifting scheme, 9/7 and 5/3 filters have been used. Out of these two filters, 5/3 filter is more suitable for lossless data compression. The following steps are necessary to get wavelet coefficients using this filter:
• Split the input into coefficients at odd and even positions,
• Perform a predict-step, that is the operation given below.

y[2n+1] = x[2n+1] - {x[2n] + x[2n+2]}/2

Perform update-step, that is the operation given below.
y[2n] = x[2n] + {y[2n-1] + y[2n+1]}/4

These operations are realized in the below figures.



![Screenshot 2024-02-07 093325](https://github.com/DevinduDh/DWT-Verilog/assets/76746921/8b13ccd6-2635-4c8c-9985-841587c58b99)
![Screenshot 2024-02-07 093316](https://github.com/DevinduDh/DWT-Verilog/assets/76746921/68898585-054b-4e01-8636-4548cd5a0860)
![Screenshot 2024-02-07 093305](https://github.com/DevinduDh/DWT-Verilog/assets/76746921/f2b87e06-b625-4f00-a4bb-f4c970164a03)
