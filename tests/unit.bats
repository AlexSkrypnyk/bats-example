#!/usr/bin/env bats

@test "2" {
    run "./2.sh"
    [[ "$status" -eq 0 ]]
    [[ "$output" == "2" ]]
}

@test "4" {
    run "./4.bash"
    [[ "$status" -eq 0 ]]
    [[ "$output" == "4" ]]
}

@test "6" {
    run "./subdir/6.sh"
    [[ "$status" -eq 0 ]]
    [[ "$output" == "6" ]]
}

@test "8" {
    run "./subdir/8.bash"
    [[ "$status" -eq 0 ]]
    [[ "$output" == "8" ]]
}
