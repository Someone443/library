# frozen_string_literal: true

# Interacting with YAML database
module DbHelper
  SAFE_MODELS = %w[books authors readers orders].freeze

  def load(model)
    YAML.load_file(path(model)) if safe_model?(model)
  rescue SystemCallError
    []
  end

  def save(model, storage)
    File.write(path(model), storage.to_yaml) if safe_model?(model)
  end

  def path(model)
    "./db/#{model}.yml"
  end

  def safe_model?(model)
    raise ArgumentError, "unknown model '#{model}'" unless SAFE_MODELS.include?(model)

    true
  end

  def exists?(object, collection)
    collection.any? do |other|
      (object.class == other.class) && (object.to_s == other.to_s)
    end
  end
end
