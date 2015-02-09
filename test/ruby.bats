#!/usr/bin/env bats

@test "It should use Ruby 2.2.0" {
  ruby -v | grep 2.2.0
}

@test "It should execute Ruby code" {
  ruby -e "puts 'Hello'" | grep Hello
}

@test "It should install Bundler" {
  which bundler
}

@test "It should be protected against CVE-2014-2525" {
  skip  # Ubuntu has backported the fix to libyaml 0.1.4
  ruby -rpsych -e 'p Psych.libyaml_version[2] > 5' | grep true
}

@test "It should be protected against CVE-2014-2525" {
  run dpkg -s libyaml-dev
  [[ "$output" =~ "0.1.4-2ubuntu0.12.04.4" ]]
}
