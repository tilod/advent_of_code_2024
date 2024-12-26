MUL = /mul\((\d+),(\d+)\)/.freeze

line = File.read("../_input/day3.txt")

segments = line.split("do()").map { |s| s.split("don't()") }.map(&:first)

puts line.scan(MUL).map { |a, b| a.to_i * b.to_i }.sum
puts segments.map { |s| s.scan(MUL).map { |a, b| a.to_i * b.to_i }.sum }.sum
