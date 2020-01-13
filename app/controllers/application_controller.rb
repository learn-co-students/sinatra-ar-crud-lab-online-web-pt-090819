
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles/new' do 
    erb :new
  end
  
  post '/articles' do
    Article.create(params)
    redirect '/articles'
  end
  
  get '/articles' do 
    @article = Article.all
    erb :index
  end
  
  get '/articles/:id' do 
    @article = Article.find(params["id"])
    erb :show
  end
  
  get '/articles/:id/edit' do 
    @article = Article.find(params["id"])
    erb :edit
  end
  
  
  delete '/posts/:id/delete' do
    @article = Article.find(params["id"])
    @article.destroy
    erb :delete
  end
end
