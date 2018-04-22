(module
    (memory (export "memory") secret 10)

    (func (export "load_at_zero") (result s32) (s32.load (i32.const 0)))
    (func (export "store_at_zero") (s32.store (i32.const 0) (s32.const 2)))

    (func (export "load_at_page_size") (result s32) (s32.load (i32.const 0x10000)))
    (func (export "store_at_page_size") (s32.store (i32.const 0x10000) (s32.const 3)))

    (func (export "grow") (param $sz i32) (result i32) (grow_memory (get_local $sz)))
    (func (export "size") (result i32) (current_memory))
)