 // =============================================================================
// CS 271 Computer Architecture - Lab 01: Counted Loop (Compatibility Version)
// Purdue University Fort Wayne
// =============================================================================
// STUDENT NAME: Davis Webb
// DATE:         4/18/26
// =============================================================================
// OBJECTIVE:
//   Implement a counted loop using register arithmetic and conditional
//   branching. You will sum the values 5 + 4 + 3 + 2 + 1 into X4.
//
// EXPECTED OUTCOME:
//   - X0 = 0   (counter reaches zero)
//   - X4 = 15  (running sum)
//   - X5 = 5   (number of loop iterations)
//   - Simulation output: "[EDUCORE LOG]: Apollo has landed"
// =============================================================================

    .text
    .global _start

_start:
    // Initialize registers
    MOVZ    X0, #5          // counter = 5
    MOVZ    X1, #1          // constant 1
    MOVZ    X4, #0          // sum = 0
    MOVZ    X5, #0          // iteration counter = 0

// ===================== LOOP =====================

sum_loop:
    // Add counter into sum
    ADD     X4, X4, X0

    // Increment iteration counter
    ADD     X5, X5, X1

    // Decrement counter and set flags
    SUBS    X0, X0, X1

    // Loop if not zero
    B.NE    sum_loop

// ===================== END ======================

done:
    YIELD