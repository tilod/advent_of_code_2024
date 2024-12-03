import functools

with open("../_input/day1.txt", "r") as f:
    list1, list2 = zip(*[line.strip().split("   ") for line in f.readlines()])

list1 = sorted(map(int, list1))
list2 = sorted(map(int, list2))

result1 = sum(abs(x1 - x2) for x1, x2 in zip(list1, list2))
result2 = functools.reduce(lambda s, i: s + i * list2.count(i), list1, 0)
# result2 = sum(i * list2.count(i) for i in list1)

print(result1)
print(result2)
