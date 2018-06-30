(module
    (func $classify32 untrusted (param i32) (result s32)
        (s32.classify (get_local 0)))

    (func $declassify32 (param s32) (result i32)
        (i32.declassify (get_local 0)))

    (func $classify64 untrusted (param i64) (result s64)
        (s64.classify (get_local 0)))

    (func $declassify64 (param s64) (result i64)
        (i64.declassify (get_local 0)))

    (func (export "invokeTrusted") (result i32)
        (call $declassify32 (s32.const 5)))
)