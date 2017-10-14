class Complement
  DNA_NUCLEOTIDES = 'ACGT'.freeze
  RNA_NUCLEOTIDES = 'UGCA'.freeze

  def self.of_dna(strand)
    if valid_dna?(strand)
      strand.tr(DNA_NUCLEOTIDES, RNA_NUCLEOTIDES)
    else
      ''
    end
  end

  def self.valid_dna?(strand)
    /^[#{DNA_NUCLEOTIDES}]*$/ =~ strand
  end
end

module BookKeeping
  VERSION = 4
end
