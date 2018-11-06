class MadLib < ApplicationRecord
  has_many :solutions
  has_many :fields
  attr_reader :formatted_fields

  def construct_fields
    FieldFactory.new(text, self.id)
  end

  def has_field?(label)
    if self.fields.length == 0
      construct_fields
      self.reload
    end
    formatted_labels.include? label
  end

  def formatted_labels
    self.fields.map {|field| field.formatted_label}
  end

  # BELOW PASSES 12 TESTS

  # def parsed_fields
  #   text.scan(/[\{]+([^}]+)[}]+/).flatten
  # end

  # def format_fields
  #   @formatted_fields = []
  #   field_counts.each do |field, count|
  #     increment = 0
  #     until increment == count
  #       increment += 1
  #       counted_field = field + " (#{increment}):"
  #       @formatted_fields << counted_field.capitalize
  #     end
  #   end
  # end
  
  # def field_counts
  #   f_counts = {}
  #   unique_fields.each do |field| 
  #     f_counts[field] = parsed_fields.count(field)
  #   end
  #   f_counts
  # end

  # def unique_fields
  #   parsed_fields.uniq
  # end

  # def has_field?(label)
  #   format_fields
  #   formatted_fields.include? label
  # end

  # def formatted_text
  #   field_counts.each do |field, count|
  #     increment = 1
  #     count.times do
  #       text.sub!("{#{field}}", "#{field.capitalize} (#{increment}):")
  #       increment += 1
  #     end
  #   end
  #   text
  # end

end