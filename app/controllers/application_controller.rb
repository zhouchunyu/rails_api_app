class ApplicationController < ActionController::API
  attr_accessor :current_user

  def api_error(opts = {})
    render nothing: true, status: opts[:status]
  end

  def authenticate_user!
    token, options = ActionController::HttpAuthentication::Token.token_and_options(request)
    user_email = options.blank?? nil : options[:email]
    user = user_email && User.find_by(email: user_email)
    if user && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token)
      self.current_user = user
    else
      return api_error(status: 401)
    end
  end

  def paginate(resource)
    resource = resource.page(params[:page] || 1)
    if params[:per_page]
      resource = resource.per(params[:per_page])
    end

    return resource
  end

end
