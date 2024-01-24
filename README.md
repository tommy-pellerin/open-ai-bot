Dans le dossier il y a :
1.lib : contenant l'ensemble des application en ruby
  1.1.app.rb : 1er fichier pour apprendre à utiliser dotenv
  1.2.labyrinth.rb : génere un labyrinth (le fichier comportait des erreurs que j'ai utilisé l'ia pour m'aider à debugger)
  1.3.open_ai_conversation.rb : ce fichier est connecté à OPENAI et permet de communiquer avec CHATGPT en live.
  1.4.open_ai_ccooking.rb : ce fichier est connecté à OPENAI et permet de générer des recette de cuisine etc...

2.spec : contenant l'ensemble des fichiers test ruby

3.'.gitignore' : permettant de dire à git : "yo git, tu ignoreras les élément qui sont décrit à l'intérieur de moi"

4.'.rspec' : permettant de lancer des test à l'aide des programmes qui sont dans le dossier 'spec'

5.Gemfile : le plus cool, il indique la version Ruby utilisé dans ce dossier et il liste l'ensemble des gems utilisé dans ce dossier (surtout par les applications dans 'lib')

6.Gemfile.lock : un fichier généré par Gemfile avec la touch "bundle install". 
  à quoi il sert ? 
  => il ls'occupe de dire à ton ordi : "pour ce dossier, rends telle ou telle gem disponible". Ne modifie jamais à la main un Gemfile.lock : dès que tu ajoutes ou enlèves une gem de ton Gemfile, il te faudra faire à nouveau $ bundle install, ce qui met à jour les gems utilisées pour le dossier et le Gemfile.lock .