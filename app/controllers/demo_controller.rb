class DemoController < ApplicationController
  def index
    @logger_level=logger.level
    @pid = Process.pid
  end
end
