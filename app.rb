require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}

get ('/') do
  @stores = Store.all
  erb(:index)
end

post('/stores/new') do
  if Store.create(:name => params['store_name'])
  redirect ('/')
  else
    erb(:error)
  end
end

post('/shoes/new') do
  if Shoe.create(:name => params['store_name'], :store_ids => [params['store_id']])
  redirect ('/')
  else
    erb(:error)
  end
end
