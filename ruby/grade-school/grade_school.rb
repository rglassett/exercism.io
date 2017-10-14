class School
  def initialize
    @students_by_grade = Hash.new { |hash, key| hash[key] = [] }
  end

  def add(name, grade)
    @students_by_grade[grade] << name
  end

  def students(grade)
    @students_by_grade[grade].sort
  end

  def students_by_grade
    @students_by_grade.keys.sort.map do |grade|
      { grade: grade, students: students(grade) }
    end
  end
end

module BookKeeping
  VERSION = 3
end
