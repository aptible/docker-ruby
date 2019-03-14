#!/usr/bin/env bats

@test "It should use Ruby ${RUBY_VERSION}" {
  # Ruby 1.9.3-pXXX returns 1.9.3pXXX as the version string
  ruby_version_string="$(echo "${RUBY_VERSION}" | tr -d '-')"
  ruby -v | grep "${ruby_version_string}"
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
  # Fixed in 0.1.4-2 in Debian: https://security-tracker.debian.org/tracker/CVE-2014-2525
  # Fixed in 0.1.4-2 in Ubuntu: http://www.ubuntu.com/usn/usn-2160-1/
  # 1.6 is not affected
  dpkg -s libyaml-dev | grep -E "Version: 0.1.(4-[2-9]|6-[0-9])"
}

@test "It should install RubyGems >= 2.6.13" {
  # See http://blog.rubygems.org/2017/08/27/2.6.13-released.html
  ruby -e 'p Gem::Version.new(Gem::VERSION) >= Gem::Version.new("2.6.13")' | grep true
}

@test "It should install tzdata" {
  dpkg -l tzdata
}

@test "It should be configured with jemalloc if flagged" {
  if ! [[ ${RUBY_CONFIG_OPTS} =~ .*\-\-with\-jemalloc.* ]]; then
    skip "'--with-jemalloc' flag not present"
  fi

  # "LIBS"      : Ruby version <= 2.5
  # "MAINLIBS"  : Ruby version > 2.5
  ruby -r rbconfig -e "puts RbConfig::CONFIG.slice('LIBS', 'MAINLIBS')" | grep "\-ljemalloc"
}
