# Bienvenue sur Centaurius-Framework
![Image1](screenshot/Capture.png)

## Comment Installer ? :
  apt update && apt install ruby gem ruby-colorize -y && 
  git clone https://github.com/Centaurius-framework/Centaurius-Framework/ && 
  cd Centaurius-Framework && 
  chmod 777 * && 
  ruby Centaurius.rb


## Comment créer vos modules ? :
   ![Lien vers video](https://www.youtube.com/watch?v=Qwb7EGFS9Tg "Video pour créer vos modules")

## Exemple de modules :

  class CentauriusModule
    attr_accessor :infos, :param
    
    def initialize
    
      @infos = {:Author => 'MuhamRB', :Description => 'Ceci est la description de lexploit', :Title => 'Sample print text'}
      
      @param = {'uri' => 'www.google.fr', 'test' => nil, 'haha' => nil}
    end

    def Main()
      puts @param["uri"]
    end
  end

## Comment Upload vos modules dans le framework :
  pour cela faite un pull requests naviguer dans le repertoire du repos
  selectionner votre fichier ou sera votre modules par exemple post
  faite "create file" pusi copier votre modules par la suite sauvegarder ceci avec save
  retourner sur le menu du repos et faire un "merge & pull requests"


### Toute l'equipe de Centaurius Framework vous remercie =)
