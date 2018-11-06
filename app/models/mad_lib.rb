class MadLib < ApplicationRecord
  has_many :solutions
  has_many :fields
  attr_reader :formatted_fields

  def has_field?(label)
    if self.fields.length == 0
      construct_fields
      self.reload
    end
    formatted_labels.include? label
  end

  def construct_fields
    FieldFactory.new(text, self.id)
  end
  
  private
    def formatted_labels
      self.fields.map {|field| field.formatted_label}
    end

end