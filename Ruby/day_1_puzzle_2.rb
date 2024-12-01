list1, list2 = File
  .read("input/day_1.txt")
  .split("\n")
  .map { |l| l.split("   ") }
  .transpose

list1.map!(&:to_i)
list2.map!(&:to_i)

result = list1.inject(0) { |sum, x| sum + x * list2.count(x) }

puts result
