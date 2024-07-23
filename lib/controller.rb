  require_relative 'gossip'
  class ApplicationController < Sinatra::Base
    get '/' do
      erb :index, locals: {gossips: Gossip.all}
    end

    get "/gossips/new/" do
      erb :new_gossip
    end

    post '/gossips/new/' do
      Gossip.new(params["gossip_author"], params["gossip_content"]).save
      redirect '/'
    end

    get '/gossips/:id' do
      id = params['id'].to_i
      erb :show, locals: {gossip: Gossip.find(id), id: id}
    end

    get '/gossips/:id/edit' do
      id = params['id'].to_i
      gossip = Gossip.find(id)

      if gossip
        erb :edit, locals: { gossip: gossip }
      else
        status 404
        "Gossip avec l'ID #{id} non trouvé."
      end
    end

    put '/gossips/:id' do
      id = params['id'].to_i
      author = params['author']
      content = params['content']
      gossip = Gossip.find(id)

      if gossip
        gossip.update(author, content)
        redirect "/gossips/#{id}"
      else
        status 404
        "Gossip avec l'ID #{id} non trouvé."
      end
    end

  end
