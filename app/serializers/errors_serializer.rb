class ErrorsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :error_messages
end
