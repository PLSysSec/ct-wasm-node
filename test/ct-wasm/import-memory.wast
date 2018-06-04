(module
    (import "lib" "mem" (memory secret 1))

    (func (export "write") (param i32) (param s32)
        (s32.store (get_local 0) (get_local 1))))