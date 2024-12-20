list1, list2 = File
  .readlines("../_input/day1.txt")
  .map { |l| l.split("   ") }
  .transpose

list1.map!(&:to_i)
list2.map!(&:to_i)

result = list1.inject(0) { |s, i| s + i * list2.count(i) }
# result = list1.map { |i| i * list2.count(i) }.sum

puts result
