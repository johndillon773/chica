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
  when 26 then 6
  when 27 then 7
  when 28 then 8
  when 29 then 9
  when 30 then 10
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
  when 0..6 then erb :layout
  else erb :wait, :layout => false
  end
end