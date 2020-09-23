class Error
  attr_reader :id,
              :error_messages

  def initialize(error_messages)
    @id = nil
    @error_messages = error_messages
  end
end
