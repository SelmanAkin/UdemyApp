require 'httparty'

class OpenAiService
  include HTTParty
  base_uri 'https://api.openai.com/v1'

  def initialize(prompt)
    @prompt = prompt
    @headers = {
      "Authorization" => "Bearer #{ENV['OPENAI_API_KEY']}",
      "Content-Type" => "application/json"
    }
  end

def chat
  body = {
    model: "gpt-3.5-turbo",
    messages: [
      { role: "user", content: @prompt }
    ],
    temperature: 0.7
  }

  response = self.class.post("/chat/completions", headers: @headers, body: body.to_json)
  parsed = JSON.parse(response.body)

  if parsed["choices"]
    parsed["choices"].first["message"]["content"]
  else
    "API Hatası: #{parsed["error"] || parsed}"
  end
end

end