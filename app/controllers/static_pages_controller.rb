class StaticPagesController < ApplicationController
  def home
    @chef = Chef.new
  end
end
