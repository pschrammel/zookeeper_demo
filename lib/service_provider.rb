require 'zk'

class ServiceProvider
  def initialize
    @zk = ZK.new(ZOOKEEPERS)
    @zk.create("/service") rescue ZK::Exceptions::NodeExists
    @path = @zk.create("/service/zookeeper-demo-",
                       {:pid => $$}.to_json, sequence: true, ephemeral: true)
  end
end

