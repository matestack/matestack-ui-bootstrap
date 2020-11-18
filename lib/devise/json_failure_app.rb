class JsonFailureApp < Devise::FailureApp

  def respond
    return super unless request.content_type == 'application/json'
    self.status = 401
    self.content_type = :json
    self.response_body = '{"error" : "authentication error"}'
  end

end
