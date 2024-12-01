list1, list2 = File
  .readlines("../input/day1.txt")
  .map { |l| l.split("   ") }
  .transpose

list1.map!(&:to_i).sort!
list2.map!(&:to_i).sort!

result = list1.zip(list2).map { |x1, x2| (x1.to_i - x2.to_i).abs }.sum

puts result
