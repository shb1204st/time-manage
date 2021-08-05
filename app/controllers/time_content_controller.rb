class TimeContentController < ApplicationController
  def index
    @time_contents = TimeContent.all
  end

  def new
    @time_content = TimeContent.new
  end

end
