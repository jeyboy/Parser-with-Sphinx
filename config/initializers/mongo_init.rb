#Mongoid.connection = Mongo::Connection.new('localhost', 27017)
#Mongoid.database = "mongo-#{Rails.env}"
#
#if defined?(PhusionPassenger)
#   PhusionPassenger.on_event(:starting_worker_process) do |forked|
#     Mongoid.connection.connect if forked
#   end
#end