class Report
  def initialize(line)
    @line = line
  end

  attr_reader :line

  def steady?
    @line.sort == @line || @line.sort.reverse == @line
  end

  def flat?
    @line.each_cons(2).all? { |a, b| (a - b).abs >= 1 && (a - b).abs <= 3 }
  end
end

class ReportsWithDampener
  def initialize(line)
    @report = Report.new(line)

    @dampened_reports = []
    @report.line.size.times do |index|
      @dampened_reports <<
        Report.new(@report.line[0...index] + @report.line[(index + 1)..-1])
    end
  end

  def safe?
    (@report.steady? && @report.flat?) ||
      @dampened_reports.any? { |r| r.steady? && r.flat? }
  end
end

lines = File.readlines("../_input/day2.txt").map { |l| l.split(" ").map(&:to_i) }

reports = lines.map { |l| Report.new(l) }
dampened_reports = lines.map { |l| ReportsWithDampener.new(l) }

puts reports.select { |r| r.steady? && r.flat? }.size
puts dampened_reports.select { |r| r.safe? }.size
