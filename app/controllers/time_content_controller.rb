class TimeContentController < ApplicationController
  def index
    @time_contents = TimeContent.all
  end
end
