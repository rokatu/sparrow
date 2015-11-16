class SparrowV1 < Sinatra::Base

  post '/temperature' do

    data = {
      values: {},
      tags: {}
    }

    if (params[:internal])
      data[:values][:internal] = params[:internal].to_f
    end
    if (params[:external])
      data[:values][:external] = params[:external].to_f
    end

    %w(fermenter type batch).map(&:to_sym).each do |tag|
      if (params[tag])
        data[:tags][tag] = params[tag]
      end
    end

    influxdb.write_point('temperature', data)

    [200, data.inspect]
  end

end
