(module
(func (export "secret_select") (param s32) (param s32) (param s32) (result s32)
    (secret_select (get_local 0) (get_local 1) (get_local 2))))