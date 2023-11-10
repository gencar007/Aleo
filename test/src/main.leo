// The 'test' program.
program test.aleo {
    struct Row {
        c1: u8,
        c2: u8,
        c3: u8
    }

    struct Board {
        r1: Row,
        r2: Row,
        r3: Row
    }

    transition check_for_win(b: Board) -> u8 {
        let winner: u8 = 0u8;
        if (b.r1.c1 == b.r1.c2 && b.r1.c2 == b.r1.c3 && b.r1.c1 != 0u8) {
            winner = b.r1.c1;
        }
        if (b.r2.c1 == b.r2.c2 && b.r2.c2 == b.r2.c3 && b.r2.c1 != 0u8) {
            winner = b.r2.c1;
        }
        if (b.r3.c1 == b.r3.c2 && b.r3.c2 == b.r3.c3  && b.r3.c1 != 0u8){
            winner = b.r3.c1;
        }
        if (b.r1.c1 == b.r2.c1 && b.r2.c1 == b.r3.c1 && b.r1.c1 != 0u8){
            winner = b.r1.c1;
        }
        if (b.r1.c2 == b.r2.c2 && b.r2.c2 == b.r3.c2 && b.r1.c2 != 0u8){
            winner = b.r1.c2;
        }
        if (b.r1.c3 == b.r2.c3 && b.r2.c3 == b.r3.c3 && b.r1.c3 != 0u8){
            winner = b.r1.c3;
        }
        if (b.r1.c1 == b.r2.c2 && b.r2.c2 == b.r3.c3 && b.r1.c1 != 0u8){
            winner = b.r1.c1;
        }
        if (b.r1.c3 == b.r2.c2 && b.r2.c2 == b.r3.c1 && b.r1.c3 != 0u8){
            winner = b.r1.c3;
        }
        return winner;
    }

    transition is_full(b: Board) -> u8 {
        let r1: bool = false;
        let r2: bool = false;
        let r3: bool = false;
        let result: u8 = 0u8;
        r1 = (b.r1.c1 != 0u8 && b.r1.c2 != 0u8 && b.r1.c3 != 0u8);
        r2 = (b.r2.c1 != 0u8 && b.r2.c2 != 0u8 && b.r2.c3 != 0u8);
        r3 = (b.r3.c1 != 0u8 && b.r3.c2 != 0u8 && b.r3.c3 != 0u8);
        if (r1 && r2 && r3){
            result = 1u8;
        }
        return result;
    }

    transition test() -> u8 {
        let res:u8 = 0u8;
        return res;
    }
}
