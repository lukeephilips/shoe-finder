require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}

get ('/') do
  @stores = Store.all
  @shoes = Shoe.all
  erb(:index)
end

post ('/stores/shoes') do
  shoe = Shoe.find(params['shoe_to'])
  store = Store.find(params['to_store'])
  store.shoes.push(shoe)
  redirect '/'
end


post('/stores/new') do
  if Store.create(:name => params['store_name'])
  redirect ('/')
  end
end

get ('/stores/:id') do
  @store = Store.find(params['id'])
  @shoes = Shoe.all
  erb(:index)
end

patch ('/stores/:id') do
  @store = Store.find(params['id'])
    if @store.update(:name => params['edit_name'])
      redirect "/stores/#{@store.id}"
    end
end
  delete ('/stores/:id') do
    @store = Store.find(params['id'])
      if @store.destroy
        redirect "/"
      end
  end

post('/shoes/new') do
  if Shoe.create(:name => params['shoe_name'])
  redirect ('/')
  end
end

delete('/shoes/:id') do
  shoe = Shoe.find(params['id'])
  if shoe.destroy
  redirect ('/')
  end
end

patch ('/stores/:id/shoes') do
  @store = Store.find(params['id'])
    shoe_ids = params.fetch('shoe_ids')
  if @store.update({:shoe_ids => shoe_ids})
    redirect "/stores/#{@store.id}"
  end
end

delete ('/stores/:id/shoes') do
  @store = Store.find(params['id'])
    shoe = Shoe.find(params.fetch('shoe_id').to_i)
  if @store.shoes.delete(shoe)
    redirect "/stores/#{@store.id}"
  end
end
