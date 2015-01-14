class DemoController < ApplicationController
  def index
    @logger_level=logger.level
  end
end
