open OUnit2
open Cryptography

let power_test
    (name : string)
    (a : int)
    (b : int)
    (expected : int) = 
  name >:: (fun _ ->
      assert_equal expected (power a b) ~printer:string_of_int
    )

let modpow_test
    (name : string)
    (a : int)
    (b : int)
    (c : int) = 
  name >:: (fun _ ->
      assert_equal ((power a b) mod c) (modpow a b c) ~printer:string_of_int
    )

let power_tests = 
  [
    power_test "power function simple test" 3 4 81;
    power_test "power function simple test" 2 3 8;
    power_test "power function expnt 1 test" 3 1 3;
    power_test "power function expnt 0 test" 7 0 1;
    power_test "power function large number" 7 13 96889010407;
    power_test "power function large number" 5 20 95367431640625;
    power_test "power function large base" 12345 3 1881365963625;
    power_test "power function very large power" 2 61 2305843009213693952;
  ]

let modpow_tests = 
  [
    modpow_test "simple modpow test" 1 2 3;
    modpow_test "modpow tests bigger numbers" 2 61 2;
    modpow_test "modpow test expnt 0" 18 0 13;
    modpow_test "regular use modpow test" 5 17 19;
    modpow_test "regular use modpow test" 133 7 5;
    modpow_test "regular use modpow test" 5 17 19;
    modpow_test "regular use modpow test" 24 10 145;
    modpow_test "regular use modpow test" 3 30 800;
    modpow_test "regular use modpow test" 77 4 82;
  ]


let suite =
  "test suite for Terracotta public key encrpytion project"  >::: List.flatten [
    power_tests;
    modpow_tests;
  ]

let _ = run_test_tt_main suite