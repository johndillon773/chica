require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"

before do
  t = Time.now
  @day = t.day
end

def max_page
  case @day
  when 24 then 2
  when 25 then 4
  when 26 then 5
  else 6
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