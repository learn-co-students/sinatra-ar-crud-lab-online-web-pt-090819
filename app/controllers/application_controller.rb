
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb:new
  end

  post '/articles' do
    articles.create(params)
    redirect '/articles'
  end

  get '/articles' do
    @articles = articles.all
    erb :index
  end

  get 'articles/:id' do
    @articles = Articles.find(params["id"])
    erb :show
  end  

  get '/articles/:id/edit' do
    @articles = Articles.find(params["id"])
    erb :edit
  end

  patch '/articles/:id' do
    id = params["id"]
    new_params = {}
    old_articles = Articles.find(id)
    new_params[:name] = params["name"]
    new_params[:content] = params["content"]
    old_articles=update(new_params)

    redirect "/articles/#{id}"
  end

  delete '/articles/:id/delete' do
    @articles = Articles.find(params["id"])
    @articles.destroy
    erb :delete
  end
end

