require 'dotenv'# Appelle la gem Dotenv
require 'http'
require 'json'


Dotenv.load # Ceci appelle le fichier .env (situé dans le même dossier que celui d'où tu exécute app.rb)


# création de la clé d'api et indication de l'url utilisée.
api_key = ENV["OPENAI_API_KEY"]
# url = "https://api.openai.com/v1/models"
url = "https://api.openai.com/v1/completions"

# un peu de json pour faire la demande d'autorisation d'utilisation à l'api OpenAI
headers = {
  "Content-Type" => "application/json",
  "Authorization" => "Bearer #{api_key}"
}

# un peu de json pour envoyer des informations directement à l'API
data = {
  "model" => "gpt-3.5-turbo-instruct",
  "prompt" => "les étapes de préparation de cuisine aléatoire et préparable en 5 minutes. La description ne doit pas avoir plus de 10 mots. Il faut que la recette soit terminée avec une phrase comme 'dégustez!' au bout de 5 lignes maximum",
  "max_tokens" => 100,
  "temperature" => 0.4
}

response = HTTP.post(url, headers: headers, body: data.to_json)

response_body = JSON.parse(response.body.to_s)

response_string = response_body['choices'][0]['text'].strip

puts "Hello, voici 1 recette de cuisine aléatoire :"
puts response_string

