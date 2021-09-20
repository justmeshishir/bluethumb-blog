class ApplicationController < ActionController::Base

  protected

  def errors?(response)
    response.key?('errors')
  end
end
