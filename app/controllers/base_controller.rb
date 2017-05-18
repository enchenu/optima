class BaseController < ApplicationController
  before_action :authenticate_user!

    layout 'panel'

  private

    def pundit_user
      current_user
    end
end
