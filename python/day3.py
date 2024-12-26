import re

MUL = r'mul\((\d+),(\d+)\)'

with open("../_input/day3.txt", "r") as file:
    line = file.read()

segments = map(lambda s: s[0],
               map(lambda s: s.split('don\'t()'), line.split('do()')))

print(
    sum(
        map(lambda x: int(x[0]) * int(x[1]), re.findall(MUL, line))))
print(
    sum(
        map(lambda s: sum(
            map(lambda x: int(x[0]) * int(x[1]), re.findall(MUL, s))), segments)))
