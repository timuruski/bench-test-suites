#! /usr/bin/env ruby

SUITES = {
  'Bacon'    => 'bacon -q spec/bacon_spec.rb',
  'Cutest'   => 'cutest spec/cutest_spec.rb',
  'Minitest' => 'ruby spec/minitest_spec.rb',
  'Riot'     => 'ruby spec/riot_spec.rb',
  'RSpec'    => 'rspec spec/rspec_spec.rb'
}
PATTERN = /([0-9.]+) real +([0-9.]+) user +([0-9.]+) sys/
COUNT = 10

puts format "%8s %8s %8s", 'Suite', 'Avg real', 'Std dev'
puts format "-" * (3 * 8 + 2)

SUITES.each do |name, cmd|
  times = Array.new(COUNT) {
    result = %x(/usr/bin/time #{cmd} 2>&1 | tail -1)
    _, real, user, sys = *result.match(PATTERN)

    [real.to_f, user.to_f, sys.to_f]
  }

  real_avg, user_avg, sys_avg = times.map { |ts|
    ts.inject(0,&:+) / ts.length }

  real_std, user_std, sys_std = times.map { |ts|
    mean = ts.inject(0,&:+) / ts.length
    var = ts.inject { |t| (t - mean) ** 2 } / ts.length
    Math.sqrt var
  }

  puts format "%8s %8.3f %8.3f", name, real_avg, real_std
end
