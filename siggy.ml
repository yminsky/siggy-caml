open Base
open Stdio

let print_s = Core_kernel.print_s

let () = printf "Hello, World!\n"

let double x = x * 2

let () =
  print_s [%sexp (double 5 : int)]