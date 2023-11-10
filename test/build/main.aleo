program test.aleo;

struct Row:
    c1 as u8;
    c2 as u8;
    c3 as u8;

struct Board:
    r1 as Row;
    r2 as Row;
    r3 as Row;


function check_for_win:
    input r0 as Board.private;
    is.eq r0.r1.c1 r0.r1.c2 into r1;
    is.eq r0.r1.c2 r0.r1.c3 into r2;
    and r1 r2 into r3;
    is.neq r0.r1.c1 0u8 into r4;
    and r3 r4 into r5;
    ternary r5 r0.r1.c1 0u8 into r6;
    is.eq r0.r2.c1 r0.r2.c2 into r7;
    is.eq r0.r2.c2 r0.r2.c3 into r8;
    and r7 r8 into r9;
    is.neq r0.r2.c1 0u8 into r10;
    and r9 r10 into r11;
    ternary r11 r0.r2.c1 r6 into r12;
    is.eq r0.r3.c1 r0.r3.c2 into r13;
    is.eq r0.r3.c2 r0.r3.c3 into r14;
    and r13 r14 into r15;
    is.neq r0.r3.c1 0u8 into r16;
    and r15 r16 into r17;
    ternary r17 r0.r3.c1 r12 into r18;
    is.eq r0.r1.c1 r0.r2.c1 into r19;
    is.eq r0.r2.c1 r0.r3.c1 into r20;
    and r19 r20 into r21;
    is.neq r0.r1.c1 0u8 into r22;
    and r21 r22 into r23;
    ternary r23 r0.r1.c1 r18 into r24;
    is.eq r0.r1.c2 r0.r2.c2 into r25;
    is.eq r0.r2.c2 r0.r3.c2 into r26;
    and r25 r26 into r27;
    is.neq r0.r1.c2 0u8 into r28;
    and r27 r28 into r29;
    ternary r29 r0.r1.c2 r24 into r30;
    is.eq r0.r1.c3 r0.r2.c3 into r31;
    is.eq r0.r2.c3 r0.r3.c3 into r32;
    and r31 r32 into r33;
    is.neq r0.r1.c3 0u8 into r34;
    and r33 r34 into r35;
    ternary r35 r0.r1.c3 r30 into r36;
    is.eq r0.r1.c1 r0.r2.c2 into r37;
    is.eq r0.r2.c2 r0.r3.c3 into r38;
    and r37 r38 into r39;
    is.neq r0.r1.c1 0u8 into r40;
    and r39 r40 into r41;
    ternary r41 r0.r1.c1 r36 into r42;
    is.eq r0.r1.c3 r0.r2.c2 into r43;
    is.eq r0.r2.c2 r0.r3.c1 into r44;
    and r43 r44 into r45;
    is.neq r0.r1.c3 0u8 into r46;
    and r45 r46 into r47;
    ternary r47 r0.r1.c3 r42 into r48;
    output r48 as u8.private;


function is_full:
    input r0 as Board.private;
    is.neq r0.r1.c1 0u8 into r1;
    is.neq r0.r1.c2 0u8 into r2;
    and r1 r2 into r3;
    is.neq r0.r1.c3 0u8 into r4;
    and r3 r4 into r5;
    is.neq r0.r2.c1 0u8 into r6;
    is.neq r0.r2.c2 0u8 into r7;
    and r6 r7 into r8;
    is.neq r0.r2.c3 0u8 into r9;
    and r8 r9 into r10;
    is.neq r0.r3.c1 0u8 into r11;
    is.neq r0.r3.c2 0u8 into r12;
    and r11 r12 into r13;
    is.neq r0.r3.c3 0u8 into r14;
    and r13 r14 into r15;
    and r5 r10 into r16;
    and r16 r15 into r17;
    ternary r17 1u8 0u8 into r18;
    output r18 as u8.private;


function test:
    output 0u8 as u8.private;
