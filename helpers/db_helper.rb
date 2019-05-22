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
end
