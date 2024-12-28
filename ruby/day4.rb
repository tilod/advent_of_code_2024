class Puzzle1
  XMAS = /XMAS/.freeze
  SAMX = /SAMX/.freeze

  def initialize(lines)
    @horizontal = lines
    @vertical = lines
      .map { |line| line.split('') }
      .transpose
      .map { |line| line.join('') }

    @diagonal_forward = lines
      .map { |line| line.split('') }
      .map { |line| line.append("-") }
      .map.with_index { |line, index| line.rotate(index) }
      .transpose
      .map { |line| line.join('') }

    @diagonal_backward = lines
      .map { |line| line.split('') }
      .map { |line| line.append("-") }
      .map.with_index { |line, index| line.rotate(-index) }
      .transpose
      .map { |line| line.join('') }
  end

  def solve
    matches_count(@horizontal) +
      matches_count(@vertical) +
      matches_count(@diagonal_forward) +
      matches_count(@diagonal_backward)
  end

  private

  def matches_count(lines)
    lines
      .map { |line| line.scan(XMAS).size + line.scan(SAMX).size }
      .sum
  end
end

class Puzzle2
  def initialize(lines)
    @lines = lines
  end

  def solve
    matches_count = 0

    @lines.each_with_index do |line, y|
      line.length.times do |x|
        if matches_mas_mas(x, y) ||
          matches_mas_sam(x, y) ||
          matches_sam_mas(x, y) ||
          matches_sam_sam(x, y)
          matches_count += 1
        end
      end
    end

    matches_count
  end

  private

  def matches_mas_mas(x, y)
    @lines.fetch(y, "")[x] == "M" &&
      @lines.fetch(y, "")[x+2] == "M" &&
      @lines.fetch(y+1, "")[x+1] == "A" &&
      @lines.fetch(y+2, "")[x] == "S" &&
      @lines.fetch(y+2, "")[x+2] == "S"
  end

  def matches_mas_sam(x, y)
    @lines.fetch(y, "")[x] == "M" &&
      @lines.fetch(y, "")[x+2] == "S" &&
      @lines.fetch(y+1, "")[x+1] == "A" &&
      @lines.fetch(y+2, "")[x] == "M" &&
      @lines.fetch(y+2, "")[x+2] == "S"
  end

  def matches_sam_mas(x, y)
    @lines.fetch(y, "")[x] == "S" &&
      @lines.fetch(y, "")[x+2] == "M" &&
      @lines.fetch(y+1, "")[x+1] == "A" &&
      @lines.fetch(y+2, "")[x] == "S" &&
      @lines.fetch(y+2, "")[x+2] == "M"
  end

  def matches_sam_sam(x, y)
    @lines.fetch(y, "")[x] == "S" &&
      @lines.fetch(y, "")[x+2] == "S" &&
      @lines.fetch(y+1, "")[x+1] == "A" &&
      @lines.fetch(y+2, "")[x] == "M" &&
      @lines.fetch(y+2, "")[x+2] == "M"
  end
end

puts Puzzle1.new(File.readlines("../_input/day4.txt")).solve
puts Puzzle2.new(File.readlines("../_input/day4.txt")).solve
