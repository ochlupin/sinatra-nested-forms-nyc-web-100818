require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :root
    end

    # Create

    #1. get

    get '/new' do
      erb :'/pirates/new' # routes to pirates/new.erb
    end

    #2. post

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])

      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
      @ships = Ship.all

      erb :'pirates/show'
    end

  end
end
