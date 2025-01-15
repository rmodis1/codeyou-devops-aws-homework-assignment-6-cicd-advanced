# frozen_string_literal: true

require 'sinatra'
require 'erb'

# The App class serves as the main application logic.
# It includes methods to handle user interactions.
class App
  def self.greet(name)
    # Escape the name to prevent XSS
    "Hello, #{Rack::Utils.escape_html(name)}!"
  end
end

get '/' do
  erb :index
end

post '/greet' do
  name = params[:name]
  greeting = App.greet(name || 'Guest')
  erb :greet, locals: { greeting: greeting }
end

__END__

@@index
<form action="/greet" method="POST">
  <label for="name">Enter your name:</label>
  <input type="text" id="name" name="name">
  <button type="submit">Submit</button>
</form>

@@greet
<h1><%= greeting %></h1>