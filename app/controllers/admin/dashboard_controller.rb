class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['BASIC_USERNAME'], password: ENV['BASIC_PASSWORD']
  def show
  end
end
