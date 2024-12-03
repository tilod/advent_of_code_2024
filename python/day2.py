class Report:
    def __init__(self, line):
        self.line = line

    def is_steady(self):
        return (self.line == sorted(self.line) or
                self.line == sorted(self.line, reverse=True))

    def is_flat(self):
        return all(1 <= abs(a - b) <= 3 for a, b in zip(self.line, self.line[1:]))

class DampenedReport:
    def __init__(self, line):
        self.report = Report(line)

        self.dampened_reports = []
        for i in range(len(self.report.line)):
            self.dampened_reports.append(Report(self.report.line[:i] + self.report.line[i+1:]))

    def is_safe(self):
        return (self.report.is_steady() and self.report.is_flat() or
                any(r.is_steady() and r.is_flat() for r in self.dampened_reports))


with open("../_input/day2.txt", "r") as file:
    lines = [list(map(int, line.split())) for line in file.readlines()]

reports = [Report(line) for line in lines]
dampened_reports = [DampenedReport(line) for line in lines]

print(len(list(filter(lambda r: r.is_steady() and r.is_flat(), reports))))
print(len(list(filter(lambda r: r.is_safe(), dampened_reports))))
