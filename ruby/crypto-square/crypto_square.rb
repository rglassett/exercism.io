class Crypto
  def initialize(plaintext)
    @normalized_plaintext = plaintext.gsub(/[^\w]/, '').downcase
    @segmented_plaintext = normalized_plaintext
      .chars
      .each_slice(columns)
      .map(&:join)
  end

  def normalize_plaintext
    normalized_plaintext.dup
  end

  def size
    columns
  end

  def plaintext_segments
    segmented_plaintext.dup
  end

  def ciphertext
    columns.times.each_with_object('') do |col, ciphertext|
      segmented_plaintext.each_index do |row|
        next unless segmented_plaintext[row][col]
        ciphertext << segmented_plaintext[row][col]
      end
    end
  end

  def normalize_ciphertext
    text = ciphertext
    words_to_truncate = rows * columns - text.length
    truncation_start = text.length - words_to_truncate * (rows - 1)

    [
      text[0...truncation_start].chars.each_slice(rows).map(&:join),
      text[truncation_start..-1].chars.each_slice(rows - 1).map(&:join)
    ].reject(&:empty?).join(' ')
  end

  private

  attr_reader :normalized_plaintext, :segmented_plaintext

  def columns
    Math.sqrt(normalized_plaintext.length).ceil
  end

  def rows
    normalized_plaintext.length.fdiv(columns).ceil
  end
end
