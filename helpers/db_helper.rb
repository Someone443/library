# frozen_string_literal: true

# Interacting with YAML database
module DbHelper
  def load(model)
    YAML.load_file("./db/#{model}.yml")
  rescue StandardError
    false
  end

  def save(model, app)
    File.write("./db/#{model}.yml", app.send(model.to_s).to_yaml)
  end

  def exists?(obj, collection)
    iv = obj.instance_variables
    collection.any? do |e|
      (obj.class == e.class) &&
      (iv.all? { |v| obj.instance_variable_get(v).to_s == e.instance_variable_get(v).to_s })
    end
  end
end
