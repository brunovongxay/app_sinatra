require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  get '/gossips/new/' do # permet de rediriger la navigation vers la page des nouveaux gossip
    erb :new_gossip
  end
  post '/gossips/new/' do # permet de créer un nouveau potin avec un nom
  Gossip.new(params["gossip_author"] , params["gossip_content"]).save
  redirect '/'
  end
  get '/gossips/:id/' do # permet d'automatiser les potins
    erb :show, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end

end