class ErrorsSerializer
  def initialize(model)
    @model = model
  end

  def errors_hash
    if @model.errors.messages.empty?
      error_messages = ["credentials are bad"]
    else
      error_messages = @model.errors.to_hash(true).map do |_, message|
        message.join
      end
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
