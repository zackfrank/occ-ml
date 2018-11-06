class FieldFactory
  attr_reader :formatted_fields
  attr_reader :parsed_fields
  attr_reader :defined_labels

  def initialize(text, mad_lib_id)
    @parsed_fields = parse_fields(text)
    define_labels
    construct_fields(mad_lib_id)
  end

  private
    def construct_fields(mad_lib_id)
      defined_labels.each do |labels|
        f = Field.new(mad_lib_id: mad_lib_id)
        f.set_labels(labels)
        f.save
      end
    end

    def define_labels
      @defined_labels = []
      field_counts.each do |field, count|
        increment = 0
        until increment == count
          increment += 1
          counted_field = field + " (#{increment}):"
          labels = {}
          labels[:original_label] = field
          labels[:formatted_label] = counted_field.capitalize
          @defined_labels << labels
        end
      end
    end

    def parse_fields(text)
      text.scan(curly_braces_regex).flatten
    end

    def curly_braces_regex
      /[\{]+([^}]+)[}]+/
    end

    def field_counts
      f_counts = {}
      unique_fields.each do |field| 
        f_counts[field] = parsed_fields.count(field)
      end
      f_counts
    end

    def unique_fields
      parsed_fields.uniq
    end
end