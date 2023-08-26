#!/usr/bin/env bats

@test "goodbye without arguments" {
    run "./scripts/goodbye.sh"
    [[ "$status" -eq 0 ]]
    [[ "$output" == "Goodbye unknown" ]]
}

@test "goodbye with world argument" {
    run "./scripts/goodbye.sh" "world"
    [[ "$status" -eq 0 ]]
    [[ "$output" == "Goodbye World" ]]
}
