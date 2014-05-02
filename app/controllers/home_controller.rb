class HomeController < ApplicationController
  before_filter :authorize!, except: [:new]

  def index
  end
end
