require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}

get ('/') do
  @stores = Store.all
  @shoes = Shoe.all
  erb(:index)
end

get ('/stores/:id') do
  @store = Store.find(params['id'])
  erb(:store)
end

patch ('/stores/:id') do
  @store = Store.find(params['id'])
    if @store.update(:name => params['edit_name'])
      redirect "/stores/#{@store.id}"
    else
      erb(:error)
    end
end
  delete ('/stores/:id') do
    @store = Store.find(params['id'])
      if @store.destroy
        redirect "/"
      else
        erb(:error)
      end
  end

post('/stores/new') do
  if Store.create(:name => params['store_name'])
  redirect ('/')
  else
    erb(:error)
  end
end

post('/shoes/new') do
  if Shoe.create(:name => params['shoe_name'])
  redirect ('/')
  else
    erb(:error)
  end
end
