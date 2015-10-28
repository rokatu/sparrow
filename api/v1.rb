class SparrowV1 < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

end
