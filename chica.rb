require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"

get "/" do
  redirect "/0"
end

get "/:index" do
  @current_page = params[:index].to_i
  case @current_page
  when 0 then erb :home
  when 1 then erb :pretty
  when 2 then erb :traits
  else        erb :wait, :layout => false
  end
end