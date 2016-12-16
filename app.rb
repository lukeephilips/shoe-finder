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
  new_store = Store.new(:name => params['store_name'])
  if new_store.save
    redirect ('/')
  else
    @errors = new_store.errors
    @stores = Store.all
    @shoes = Shoe.all
    erb(:index)
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
  new_shoe = Shoe.new(:name => params['shoe_name'])
  if new_shoe.save
    redirect ('/')
  else
    @errors = new_shoe.errors
    @stores = Store.all
    @shoes = Shoe.all
    erb(:index)
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

post ('/stores/:id/shoes') do
  @store = Store.find(params['id'])
  new_shoe = Shoe.new(:name => params['shoe_name'])
  if new_shoe.save
    @store.shoes.push(new_shoe)
    redirect "/stores/#{@store.id}"
  else
    @errors = new_shoe.errors
    @shoes = Shoe.all
    erb(:index)
  end
end

delete ('/stores/:id/shoes') do
  @store = Store.find(params['id'])
    shoe = Shoe.find(params.fetch('shoe_id').to_i)
  if @store.shoes.delete(shoe)
    redirect "/stores/#{@store.id}"
  end
end
