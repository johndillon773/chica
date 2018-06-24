require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"

before do
  @day = Time.now.day
end

def max_page
  case @day
  when 24 then 2
  when 25 then 4
  when 26..30 then @day - 20
  when  1 then 11
  when  2 then 12
  end
end

get "/" do
  redirect "/0"
end

get "/:index" do
  @current_page = params[:index].to_i

  case @current_page
  when 0..max_page then erb :layout
  else erb :wait, :layout => false
  end
end