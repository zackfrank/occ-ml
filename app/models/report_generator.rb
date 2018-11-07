class ReportGenerator
  attr_reader :fields, :answer_counts, :label_counts
  
  def initialize
    @fields = Field.all
    @answer_counts = answer_counts
    @label_counts = label_counts
  end

  def answers
    fields.map {|field| field.value }.compact
  end

  def answer_counts
    counted_answers = []
    unique_answers.each do |answer|
      answer_count = {}
      answer_count[:answer] = answer
      answer_count[:count] = answers.count(answer)
      counted_answers << answer_count
    end
    counted_answers
  end

  def unique_answers
    answers.uniq
  end

  def original_labels
    fields.map {|field| field.original_label}.compact
  end

  def first_words_of_original_labels
    original_labels.map {|label| get_first_word(label)}
  end

  def unique_labels
    first_words_of_original_labels.uniq
  end

  def format(label)
    label.capitalize << 's'
  end

  def get_first_word(label)
    label.split(" ")[0].split(",")[0]
  end

  def label_counts
    counted_labels = []
    unique_labels.each do |label| 
      label_count = {}
      label_count[:label] = format(label)
      label_count[:count] = first_words_of_original_labels.count(label)
      counted_labels << label_count
    end
    counted_labels
  end

end