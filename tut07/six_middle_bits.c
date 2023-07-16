#include <stdint.h>
#include <stdio.h>

uint32_t six_middle_bits(uint32_t bits);

int main(int argc, char *argv[]) {
    uint32_t test = 0b10111101110011011011110000100101; // 0xBDCDBC25
    // This test case should give 0b101101, or 0x2D
    printf("Six middle bits of %x are %x\n", test, six_middle_bits(test));
    return 0;
}

// Write a function, six_middle_bits, which given a uint32_t
// returns the middle six bits of it.
uint32_t six_middle_bits(uint32_t bits) {
    // Step 1: Make the mask
    uint32_t mask = 0x3f; // 0b00000000000000000000000000111111

    char bits_str[] = "0101010101010101";
    for (int i = 0; i < 16; i++) {
        printf("bits[%d] is %c : %d : %x\n", i, bits_str[i], bits_str[i], bits_str[i]);
    }

    // Step 2: Align mask and value
    uint32_t moved_bits = bits >> 13;
    // Since we don't assign to `bits`, the original value is *not* changed

    // Step 3: extract value
    uint32_t result = moved_bits & mask;

    // One line equivalent:
    uint32_t res2 = (bits >> 13) & 0x3f;

    // Moving mask example:
    uint32_t res3 = (bits & (mask << 13));
    // Note that this is not aligned to the right, it needs to be moved back
    // to make further operations easier
    res3 = res3 >> 13;

    // All of these operations produce equivalent, equal results
    // None modify the original variable
    return (uint32_t)result;
}

// 0b11000000 >> 2 = 0b00110000

// 0b0001 or
// 0b0010
// ------
// 0b0011

//  "1010'1010'1010'1010"
//  vvvvvvvvvvv
// 0b0000'0000'0000'0000
// 0b1000'0000'0000'0000

// 0b0110'1010