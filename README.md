# Projet d'assitant vocale d'aide a la consommation "Allo" - Gobelins, 2018
> Benjamin Gammaire, Quentin Tshaimanga, Léo Ternoir, Sofia Boggio

## A. Architecture globale

### 1. Présentation :
  La premiére étape du projet "Allo" a était d'achitecturer un MVP. Ce dernier est divisé en différentes "briques logiques", nos microservices. Cette architecture est porté par Docker et comprend 4 miscroservices interconnectées par une API middleware.
  
  - Pour démarrer le projet, veuillez installer docker sur votre machine. Utilisez, par exemple, "Docker for Mac" disponible à l'URL suivante : https://store.docker.com/editions/community/docker-ce-desktop-mac 


  [link to Google!]()

### 2. Nos microservices :
- Une API middleware de type REST permettant d'interconnecté les différents microservices entre-eux. C'est le point de connection et de routage des requetes provenant de l'extérieur avec les différentes logiques et bases de données de notre services.
    - dossier: docker-api 
    - nom: service-api

- Une moteur de recherche et d'analyse RestFull et distribué basé sur Elasticsearch afin d'organiser la recherche des produits en fonction de tags retournant un score de pertinence spécifique pour une profil utilisateur donné. Le microservice comprendre une interface pour elasticsearch (moteur de recherche synthaxique), kibana (outils backoffice d'analyse graphique et d'indéxation des données) et logstash (aggrégation des différents logs applicatifs).
    - dossier: docker-elk
    - nom: service-elk

- Une base de donné NoSQL distribuée MongoDB destinée a collecté les différents profils utilisateurs. Le microsevide dispose d'une interafce d'administration backoffice pour facilité la manipulation des data.
    - dossier: docker-mongo
    - nom: 
      - service-mongo
      - service-mongo-express

- Une API TTS (text to speach) asynchrone de conversion des données textuelle en réponse audio format .wav par l'utilisation du service AWS Polly.
    - dossier: docker-polly
    - nom: service-polly

- Un environnement de développement FrontOffice SNIPS, pour le vocle, destiné a tester notre code métier, coté assistant vocal, sans l'utilisation d'un hardware spécifique.
  - dossier: docker-snips
  - nom: service-debian

### 3. Nos scripts de démarrage : 
Afin de facilité l'utilisation d'un tel environnement nous avons automatisé certain process de démarrage par des script Bash.
- Démarrage ou premiére installlation: téléchargement des images, construction des containers Docker et création des adresses hosts: 
    - bash docker-start-all.sh
- Démarrage de l'environnement de développement FrontOffice SNIPS:
    - bash docker-start-snips.sh
- Arret des containers:
    - bash docker-stop-all.sh
- Destruction compléte des microservices et environnement (container et images):
    - bash docker-destroy-all.sh


### 4. Nos URL :
  - http://allo.host/
      - role: accées par defaut a l'API middleware, interface de présentation de l'API.
      - usage: 
        - headers: {
            user_id: String
          }

  - http://allo.host/:name
      - role: accés aux informations concernant l'assitant que vous souhaité contacter.
      - usage: 
        - headers: {
            user_id: String,
            assistant: String,
            user_tags: Object
          }

  - http://allo.host/profils/:id : 
      - role: accés au driver mongoDB pour interragir avce la collection des utilisateurs.
      - usage: 
         - usage: 
            - GET, POST, PUT, DELETE
            - headers: {
                user_id: String
              }

  - http://allo.host/kibana : 
      - role: acces à l'interface graphique kibana
       - headers: {
          user_id: String
        }

  - http://allo.host/mongo : 
      - role: acces a l'interface d'administration mongoDB
      - usage: 
        - headers: {
          user_id: String
        }


  - http://allo.host/speech/:text : 
      - role: TTS
      - usage: 
          - headers: {
            user_id: String
          }

  - http://allo.host/search/product/:name :
      - role: Accés a l'API de recherche, d'analyse et d'indexation elasticsearch
      - usage: 
          - Query Language (GET, POST, PUT, DELETE)
          - headers: {
            user_id: String,
            assistant: String,
            user_tags: Object
          }

  - http://allo.host/search/producer/:name :
      - role: Accés a l'API de recherche, d'analyse et d'indexation elasticsearch
      - usage: 
          - Query Language (GET, POST, PUT, DELETE)
          - headers: {
            user_id: String,
            assistant: String,
            user_tags: Object
          }

## B. Le mode développement : 

### 1. Les principales commandes de debugge : 
- docker-compose build : build images
- docker-compose up : up containers
- docker-compose up -d : up containers in background
- docker ps -a : list all conatiners
- docker images : list all images
- docker exec -i servicename bash : 

### 2. Liste des options pour docker-compose
- build              Build or rebuild services
- bundle             Generate a Docker bundle from the Compose file
- config             Validate and view the Compose file
- create             Create services
- down               Stop and remove containers, networks, images, and volumes
- events             Receive real time events from containers
- exec               Execute a command in a running container
- help               Get help on a command
- images             List images
- kill               Kill containers
- logs               View output from containers
- pause              Pause services
- port               Print the public port for a port binding
- ps                 List containers
- pull               Pull service images
- push               Push service images
- restart            Restart services
- rm                 Remove stopped containers
- run                Run a one-off command
- scale              Set number of containers for a service
- start              Start services
- stop               Stop services
- top                Display the running processes
- unpause            Unpause services
- up                 Create and start containers
- version            Show the Docker-Compose version information


### 3. Liste des options pour docker
- attach      Attach local standard input, output, and error streams to a running container
- build       Build an image from a Dockerfile
- commit      Create a new image from a container's changes
- cp          Copy files/folders between a container and the local filesystem
- create      Create a new container
- deploy      Deploy a new stack or update an existing stack
- diff        Inspect changes to files or directories on a container's filesystem
- events      Get real time events from the server
- exec        Run a command in a running container
- export      Export a container's filesystem as a tar archive
- history     Show the history of an image
- images      List images
- import      Import the contents from a tarball to create a filesystem image
- info        Display system-wide information
- inspect     Return low-level information on Docker objects
- kill        Kill one or more running containers
- load        Load an image from a tar archive or STDIN
- login       Log in to a Docker registry
- logout      Log out from a Docker registry
- logs        Fetch the logs of a container
- pause       Pause all processes within one or more containers
- port        List port mappings or a specific mapping for the container
- ps          List containers
- pull        Pull an image or a repository from a registry
- push        Push an image or a repository to a registry
- rename      Rename a container
- restart     Restart one or more containers
- rm          Remove one or more containers
- rmi         Remove one or more images
- run         Run a command in a new container
- save        Save one or more images to a tar archive (streamed to STDOUT by default)
- search      Search the Docker Hub for images
- start       Start one or more stopped containers
- stats       Display a live stream of container(s) resource usage statistics
- stop        Stop one or more running containers
- tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
- top         Display the running processes of a container
- unpause     Unpause all processes within one or more containers
- update      Update configuration of one or more containers
- version     Show the Docker version information
- wait        Block until one or more containers stop, then print their exit codes