class Solution < ApplicationRecord
  attr_reader :text, :formatted_text
  belongs_to :mad_lib
  has_many :fields

  def text
    text ||= mad_lib.text
  end

  def format_text
    @formatted_text = text.dup
    fields = mad_lib.fields.sort
    fields.each do |field|
      @formatted_text.sub!("{#{field.original_label}}", "#{field.formatted_label}")
    end
  end

  def fill_field(label, with:)
    format_text unless formatted_text
    formatted_text.sub!(label, with)
  end

  def resolve
    formatted_text
  end 

end
