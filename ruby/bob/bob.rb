class Bob
  class Remark < SimpleDelegator
    def question?
      end_with?('?')
    end

    def exclamation?
      self == upcase && self =~ /[A-Z]/
    end

    def empty?
      self =~ /\A\s*\z/
    end
  end

  def self.hey(remark)
    remark = Remark.new(remark.strip)
    if remark.exclamation?
      'Whoa, chill out!'
    elsif remark.question?
      'Sure.'
    elsif remark.empty?
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end
end

module BookKeeping
  VERSION = 1
end
