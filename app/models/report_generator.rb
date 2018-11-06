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
    counted_answers = {}
    unique_answers.each do |answer|
      counted_answers[answer] = answers.count(answer)
    end
    counted_answers
  end

  def unique_answers
    answers.uniq
  end

  def original_labels
    fields.map {|field| field.original_label}.compact
  end

  def unique_labels
    original_labels.uniq
  end

  # def formatted_labels
  #   unique_labels.map do |label|
  #     label.split(" ")[0].split(",")
  #     label.capitalize
  #     label << 's'
  #   end
  # end
  def format(label)
    label = get_first_word(label)
    label.capitalize!
    label << 's'
  end

  def get_first_word(label)
    label.split(" ")[0].split(",")[0]
  end

  def label_counts
    counted_labels = {}
    unique_labels.each do |label| 
      counted_labels[format(label)] = original_labels.count(label)
    end
    counted_labels
  end

end