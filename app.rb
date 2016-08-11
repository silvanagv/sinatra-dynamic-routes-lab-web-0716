require_relative 'config/environment'
require 'pry'

class App < Sinatra::Base

  get '/reversename/:name' do
    nombre = params[:name].reverse
    "#{nombre}"
  end

  get '/square/:number' do
    number = params[:number].to_i
    "#{number*number}"
  end

  get '/say/:number/:phrase' do
    @num = params[:number].to_i
    @phrase = params[:phrase]
      erb :say
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @words = []
    @words << params[:word1]
    @words << params[:word2]
    @words << params[:word3]
    @words << params[:word4]
    @words << params[:word5]
    @words = @words.join(" ")
    "#{@words}."
  end

  get '/:operation/:number1/:number2' do
    @number1 = params[:number1].to_i
    @number2 = params[:number2].to_i
    @operation = params[:operation].to_s
    var = 0

    if @operation == "add"
      var = @number1 + @number2
    elsif @operation == "multiply"
      var = @number1 * @number2
    elsif @operation == "divide"
      var = @number1 / @number2
    elsif @operation == "subtract"
      var = @number1 - @number2
    end
    "#{var}"
  end

end
