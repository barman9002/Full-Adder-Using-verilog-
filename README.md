# ⚙️ Full Adder in Verilog

This project demonstrates the implementation of a **1-bit Full Adder** using **Verilog HDL** along with a corresponding **testbench** for simulation in **Xilinx Vivado**.

---

## 🧩 Overview

A **Full Adder** is a combinational logic circuit that performs the arithmetic addition of three one-bit binary numbers:
- Two significant bits (`a` and `b`)
- One carry-in bit (`cin`)

It produces two outputs:
- **`sum`** → The result of the addition
- **`cout`** → The carry-out bit, which represents overflow to the next higher bit

---

## 🧮 Logic Table

| a | b | cin | sum | cout |
|:-:|:-:|:-:|:-:|:-:|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 0 |
| 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |

---

## 💻 Verilog Code — `full_adder.v`

```verilog
module full_adder(
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
```

### 🔍 Explanation
```
sum  = a ^ b ^ cin
cout = (a & b) | (b & cin) | (a & cin)

→ 'sum' is obtained by XORing all three inputs.
→ 'cout' is generated using OR of all carry-generating terms.
→ This represents the classic full adder equation.
```

---

## 🧪 Testbench — `full_adder_tb.v`

```verilog
`timescale 1ns / 1ps

module full_adder_tb;

    reg a, b, cin;
    wire sum, cout;

    // Instantiate the Unit Under Test (UUT)
    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $monitor("Time=%0t | a=%b b=%b cin=%b | sum=%b cout=%b", 
                  $time, a, b, cin, sum, cout);

        // Apply all possible input combinations
        a=0; b=0; cin=0; #10;
        a=0; b=0; cin=1; #10;
        a=0; b=1; cin=0; #10;
        a=0; b=1; cin=1; #10;
        a=1; b=0; cin=0; #10;
        a=1; b=0; cin=1; #10;
        a=1; b=1; cin=0; #10;
        a=1; b=1; cin=1; #10;

        $display("Simulation completed!");
        $finish;
    end

endmodule
```

---

## ▶️ Simulation Steps (Vivado)

```
1️⃣ Open Vivado → Create a new project (e.g. combinational)
2️⃣ Add `full_adder.v` as Design Source
3️⃣ Add `full_adder_tb.v` as Simulation Source
4️⃣ From Flow Navigator → Run Simulation → Run Behavioral Simulation
5️⃣ Observe:
    - Tcl Console: Output from $monitor
    - Waveform Window: Signals (a, b, cin, sum, cout)
```

---

## 📊 Expected Console Output

```
Time=0  | a=0 b=0 cin=0 | sum=0 cout=0
Time=10 | a=0 b=0 cin=1 | sum=1 cout=0
Time=20 | a=0 b=1 cin=0 | sum=1 cout=0
Time=30 | a=0 b=1 cin=1 | sum=0 cout=1
Time=40 | a=1 b=0 cin=0 | sum=1 cout=0
Time=50 | a=1 b=0 cin=1 | sum=0 cout=1
Time=60 | a=1 b=1 cin=0 | sum=0 cout=1
Time=70 | a=1 b=1 cin=1 | sum=1 cout=1
Simulation completed!
```

---

## 📘 Learning Outcome

```
✔️ Learn to design and simulate combinational logic circuits in Verilog.
✔️ Understand how to write and execute a testbench.
✔️ Learn bitwise operators (^, &, |) and how they work.
✔️ Use $monitor and $display for debugging and observation.
```

---

## 🧰 Tools Used

```
Software  : Xilinx Vivado
Language  : Verilog HDL
Design    : Combinational Logic
Device    : (Any FPGA — Artix-7 / Spartan-6 / Basys3)
```

---

## 📂 Repository Structure

```
├── full_adder.v          # Verilog source file
├── full_adder_tb.v       # Testbench file
└── README.md             # Documentation
```

---

## 🧑‍💻 Author

**Abhisekh Barman**  
📘 Electronics & Computer Enthusiast | Learning Digital Design & Verification  
🔗 GitHub: [https://github.com/barman9002] 
📧 Email: abhisekhbarman688@gmail.com

---

## ⭐ Support

If you found this project helpful, please consider giving it a ⭐ on GitHub!  
It motivates me to create more HDL and FPGA-based learning projects.

---
