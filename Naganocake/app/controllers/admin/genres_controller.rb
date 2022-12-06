class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
  end

  def edit
  end
end
