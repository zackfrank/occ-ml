class Field < ApplicationRecord
  belongs_to :mad_lib
  belongs_to :solution, optional: true

  def set_labels(labels)
    set_original_label(labels[:original_label])
    set_formatted_label(labels[:formatted_label])
  end

  def set_original_label(label)
    self.original_label = label
  end

  def set_formatted_label(label)
    self.formatted_label = label
  end

end
