#! /usr/bin/env ruby

SUITES = {
  'Minitest' => 'ruby spec/minitest_spec.rb',
  'RSpec'    => 'rspec spec/rspec_spec.rb',
  'Bacon'    => 'bacon -q spec/bacon_spec.rb',
  'Riot'     => 'ruby spec/riot_spec.rb'
}
PATTERN = /([0-9.]+) real +([0-9.]+) user +([0-9.]+) sys/
COUNT = 5

SUITES.each do |name, cmd|
  times = Array.new(COUNT) {
    result = %x(/usr/bin/time #{cmd} 2>&1 | tail -1)
    _, real, user, sys = *result.match(PATTERN)

    [real.to_f, user.to_f, sys.to_f]
  }

  real_avg, user_avg, sys_avg = times.map { |ts|
    ts.inject(0,&:+) / ts.length }

  puts "#{name}: #{real_avg}"
  # puts "#{name}: #{real_avg} real #{user_avg} user #{sys_avg} sys"
end
