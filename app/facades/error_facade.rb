class ErrorFacade
  def initialize(model)
    @model = model
  end

  def messages
    if @model.errors.messages.empty?
      error_messages = "credentials are bad"
    else
      error_messages = @model.errors.to_hash(true).map do |_, message|
        message.join
      end.join(",")
    end
    Error.new(error_messages)
  end
end
