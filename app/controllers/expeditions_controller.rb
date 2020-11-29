class ExpeditionsController < ApplicationController
    before_action :require_login
    before_action :set_expedition, only: [:show, :edit, :update, :destroy]
    before_action :set_user

    def show
        allowed_user(@user, :show)
        #byebug
    end

end
