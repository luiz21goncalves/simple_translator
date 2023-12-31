# frozen_string_literal: true

require 'dotenv/load'
require 'httparty'

# Lecto client
class Lecto
  include HTTParty
  base_uri 'https://api.lecto.ai/v1'

  def translate(to:, phrase:, from:)
    self.class.post('/translate/text', body: JSON.generate({ from:, texts: [phrase], to: [to] }),
                                       headers: {
                                         'X-API-Key': ENV.fetch('LECTO_AI_API_KEY', nil),
                                         'Content-Type': 'application/json'
                                       })
  end
end
