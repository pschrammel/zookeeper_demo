require 'zk'




class ConfigWatcher
  def initialize
    @zk = ZK.new(ZOOKEEPERS)
    @zk.create("/config") rescue ZK::Exceptions::NodeExists
    @path="/config/logger"
    @zk.create(@path, Rails.logger.level.to_s) rescue ZK::Exceptions::NodeExists

  end

  def subscribe
    @sub = @zk.register(@path, :only => :changed) do |event|
      #p "event #{event.inspect}"

      if event.node_changed?
        data = @zk.get(@path, watch: true).first # fetch the latest data and re-set watch
        #p "data: #{data}"
        Rails.logger.level = data.to_i
        puts "log level: #{Rails.logger.level}"
      end
    end
    @zk.stat(@path, watch: true)

    puts "Subscribed to #{@path}, #{$$}"
  end
end

