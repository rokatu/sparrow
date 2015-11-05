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

    if (params[:fermenter])
      data[:tags][:fermenter] = params[:fermenter]
    end
    if (params[:type])
      data[:tags][:type] = params[:type]
    end

    influxdb.write_point('temperature', data)

    [200, data.inspect]
  end

end
