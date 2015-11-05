class SparrowV1 < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  helpers do

    def influxdb
      @influxdb ||= InfluxDB::Client.new(
        ENV['INFLUXDB_DATABASE'],
        username: ENV['INFLUXDB_USERNAME'],
        password: ENV['INFLUXDB_PASSWORD'])
    end

  end
end
