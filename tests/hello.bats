#!/usr/bin/env bats

@test "hello without arguments" {
    run "./hello.sh"
    [[ "$status" -eq 0 ]]
    [[ "$output" == "Hello unknown" ]]
}

@test "hello with world argument" {
    run "./hello.sh" "world"
    [[ "$status" -eq 0 ]]
    [[ "$output" == "Hello World" ]]
}
