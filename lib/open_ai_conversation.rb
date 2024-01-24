
require 'dotenv'# Appelle la gem Dotenv
require 'http'
require 'json'
require 'pry'

Dotenv.load # Ceci appelle le fichier .env (situé dans le même dossier que celui d'où tu exécute app.rb)

conversation_history = []
def history(conversation_history,prompt_or_answer_to_stock)
  conversation_history << prompt_or_answer_to_stock.to_s
  return conversation_history
end


# création de la clé d'api et indication de l'url utilisée.
api_key = ENV["OPENAI_API_KEY"]
# url = "https://api.openai.com/v1/models"
url = "https://api.openai.com/v1/completions"

# un peu de json pour faire la demande d'autorisation d'utilisation à l'api OpenAI
headers = {
  "Content-Type" => "application/json",
  "Authorization" => "Bearer #{api_key}"
}

def converse_with_ai(api_key,url,headers,conversation_history)
  # un peu de json pour envoyer des informations directement à l'API
  puts "Quest veux tu demander à chatGPT ?"
  loop do
    print "Entre 'q' pour arreter > "
    new_prompt = gets.chomp
    
    break if new_prompt == 'q'
    # conversation_history = history(conversation_history,new_prompt)

    prompt_to_send = history(conversation_history,new_prompt).join("\n")
    # binding.pry
        
    data = {
      # "model" => "gpt-3.5-turbo-instruct",
      "model" => "gpt-3.5-turbo-instruct",
      "prompt" => prompt_to_send,
      "n" => 1,
      "max_tokens" => 300,
      "temperature" => 0

    }

    response = HTTP.post(url, headers: headers, body: data.to_json)
    response_body = JSON.parse(response.body.to_s)
    response_string = response_body['choices'][0]['text'].strip

    print "chatGPT : "
    puts response_string
    history(conversation_history,response_string)
    # conversation_history << response_string

  end
end

converse_with_ai(api_key,url,headers,conversation_history)

