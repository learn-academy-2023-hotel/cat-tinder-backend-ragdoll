class ApplicationController < ActionController::Base
    skip_before-action :verify_authenticity_token
end
