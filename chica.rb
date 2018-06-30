require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"

before do
  @day = Time.now.day
end

def max_page
  case @day
  when 30 then @day - 19
  when  1     then 20
  end
end

get "/" do
  redirect "/0"
end

get "/:index" do
  @current_page = params[:index].to_i

  case @current_page
  when 0..max_page
    erb :layout
  else 
    case @day
    when 30
      erb :wait, :layout => false
    when 1
      erb :happy, :layout => false
    end
  end
end