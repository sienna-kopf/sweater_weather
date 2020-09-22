class ErrorsSerializer
  def initialize(model)
    @model = model
  end

  def errors_hash
    error_messages = @model.errors.to_hash(true).map do |_, message|
      message.join
    end
    json_hash = {
      errors:
      {
        status: 400,
        error_messages: error_messages
      }
    }
  end
end
