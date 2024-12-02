with open("../_input/day1.txt", "r") as f:
    list1, list2 = zip(*[line.strip().split("   ") for line in f.readlines()])

list1 = sorted(map(int, list1))
list2 = sorted(map(int, list2))

result = sum(abs(x1 - x2) for x1, x2 in zip(list1, list2))

print(result)
