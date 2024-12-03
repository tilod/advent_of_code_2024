list1, list2 = File
  .readlines("../_input/day1.txt")
  .map { |l| l.split("   ") }
  .transpose

list1.map!(&:to_i)
list2.map!(&:to_i)

result1 = list1.sort.zip(list2.sort).map { |x1, x2| (x1.to_i - x2.to_i).abs }.sum
result2 = list1.inject(0) { |s, i| s + i * list2.count(i) }
# result2 = list1.map { |i| i * list2.count(i) }.sum

puts result1
puts result2
