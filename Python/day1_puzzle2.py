with open("../input/day1.txt", "r") as f:
    list1, list2 = zip(*[line.strip().split("   ") for line in f.readlines()])

list1 = list(map(int, list1))
list2 = list(map(int, list2))

result = sum(i * list2.count(i) for i in list1)

print(result)
