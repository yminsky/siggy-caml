open Import

let snigbot x y = (x + y) :: [1;2;3]

let sigatron = snigbot 12321 (-12321)
let () = print_s [%sexp (sigatron:int list)]