# frozen_string_literal: true

# Validate parameters
module ValidationHelper
  def not_empty_string(param)
    raise ValidationError if !(param.is_a? String) || param.empty?
  end

  def not_empty_strings(*params)
    params.each { |param| not_empty_string(param) }
  end

  def positive_integer(param)
    raise ValidationError unless (param.is_a? Integer) && param.positive?
  end

  def valid_class(param, klass)
    raise ValidationError unless param.is_a? klass
  end
end
