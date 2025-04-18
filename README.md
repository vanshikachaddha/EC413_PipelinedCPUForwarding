# EC413 Lab 9 - Forwarding and Hazard Detection

## 📝 Objective
The objective of this lab is to implement hazard detection and data forwarding in a pipelined processor. Specifically, this lab focuses on managing **Read After Write (RAW)** hazards using a **forwarding unit**, rather than stalling with NOPs.

### ✅ One-Ahead Hazard Detection (EX/MEM Forwarding)
- Detects when the current instruction needs data from the immediately preceding instruction.
- Forwarding logic implemented using multiplexers connected to the ALU inputs.
- Selection based on:
  - `EX_MEM_RegWrite` signal
  - Matching of destination register `EX_MEM_Rd` with source registers `ID_EX_Rs` or `ID_EX_Rt`
- Result:
  - If hazard is on `Rs`: `ForwardA = 2`
  - If hazard is on `Rt`: `ForwardB = 1`

### ✅ Two-Ahead Hazard Detection (MEM/WB Forwarding)
- Detects when the current instruction depends on a value that will be written two instructions earlier.
- Checks ensure that this is not a one-ahead hazard.
- Conditions:
  - `MEM_WB_RegWrite` is true
  - `MEM_WB_Rd != 0`
  - Destination register matches `ID_EX_Rs` or `ID_EX_Rt`
- Result:
  - If hazard is on `Rs`: `ForwardA = 1`
  - If hazard is on `Rt`: `ForwardB = 2`

### 🚫 Load Word (LW) Hazard
- A NOP is inserted for LW hazards since data is not available for forwarding immediately.
- Forwarding unit cannot resolve this, as memory read delay must be accounted for.

## 🔄 Waveform Output
The waveform demonstrates correct operation of the forwarding logic and hazard resolution through proper mux selections and control signal evaluation.

## 📁 Files Included
- `EC413_Lab#9.pdf`: Lab documentation and explanation.
- [Insert any relevant code files or waveform screenshots if applicable]

## 🧠 Key Takeaways
- Forwarding allows for smoother instruction flow without frequent pipeline stalls.
- Proper hazard detection logic prevents incorrect execution without affecting performance.
- Understanding data dependencies is critical for designing an efficient pipelined architecture.
