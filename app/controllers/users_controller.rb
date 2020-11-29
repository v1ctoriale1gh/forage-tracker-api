class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_user, only: [:show, :edit, :update, :destroy]
end
