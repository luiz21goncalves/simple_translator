# frozen_string_literal: true

require_relative 'languages'
require_relative 'lecto'

# Translate class
class Translate
  attr_reader :translated_phrase
  attr_accessor :to, :from, :phrase

  def call
    ask_phrase
    ask_translate_from
    ask_translate_to
    translate
  end

  def ask_phrase
    puts 'Qual frase quer traduzir?'

    @phrase = gets.chop.strip

    clear_terminal
  end

  def ask_translate_from
    Languages.table
    puts 'Digite a sigla do idioma da frase que você digitou'

    @from = gets.chop.strip

    clear_terminal
  end

  def ask_translate_to
    Languages.table
    puts 'Digite a sigla do idioma que quer traduzir'

    @to = gets.chop.strip

    clear_terminal
  end

  def translate
    puts "Traduzindo '#{@phrase}' de #{Languages.get_value(@from)} para #{Languages.get_value(@to)}."

    lecto = Lecto.new

    response = lecto.translate(to: @to, from: @from, phrase: @phrase)

    json = JSON.parse(response.body)

    @translated_phrase = json['translations'][0]['translated'][0]

    save

    puts "Tradução: '#{@translated_phrase}'"
  end

  private

  def clear_terminal
    system 'clear'
  end

  def save
    filename = Time.now.utc.strftime('%d-%m-%Y_%R.txt')

    File.open(filename, 'w') do |line|
      line.puts("de #{Languages.get_value(@from)} para #{Languages.get_value(@to)}")
      line.puts("Texto Original: #{@phrase}")
      line.puts("Tradução: #{@translated_phrase}")
    end
  end
end
