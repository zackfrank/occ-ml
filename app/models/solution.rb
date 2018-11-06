class Solution < ApplicationRecord
  attr_reader :text
  belongs_to :mad_lib
  has_many :fields

  def text
    text ||= mad_lib.text
  end

  def format_text
    fields = mad_lib.fields.sort
    fields.each do |field|
      text.sub!("{#{field.original_label}}", "#{field.formatted_label}")
    end
  end

  def fill_field(label, with:)
    format_text
    text.sub!(label, with)
  end

  def resolve
    text
  end 

end
