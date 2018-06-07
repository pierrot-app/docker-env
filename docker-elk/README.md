# Docker ELK

## Fake de data : 
Il existe de multiple doublons pour chaque produits. Cependant, chaque produit répond a un liste de critéres (tags) trés spécifiques et est donc une réponse spécifique pour un utilisateur donnée.

```
  "produit": {
    "id": "765223456",
    "input": "recette dessert maintenant tomate vegan vege",
    "key": "tomate",
    "status": "recette",
    "time": "maintenant",
    "goal": "dessert",
    "peoples": 2,
    "producteur": {
      "id": 1861,
      "name": "louis",
      "localisation": "087968574634758769709"
    }, 
    "astuce": ["une super astuce de tomate partie 1", "une super astuce de tomate parte 2"],
    "recette":  ["une super recette de tomate partie 1", "une super recette de tomate parte 2"],
    "tags": [
        {
            "tag": "vegan",
            "power": 1
        },
        {
            "tag": "sportif",
            "power": 3
        }
    ]
  }
```

## 1. Créer un mapping
```
  PUT /products
  {

  }
```

## 2. Ajouter des data
```
  POST /products/doc/${id}
  {
      
  }
```

### 3. Créer un index patterns
```
  products*
```

### 4. Exemple de Requete Kibana Lucene Query
```
  tags:vege AND sportif AND key:"carotte" AND time:"maintenant" AND status:"recette"
  time:maintenant AND tags:vege AND sportif
  input:recette AND maintenant AND carotte AND sportif
  input:recette maintenant carotte vege, sportif
```

## 5. Exemple de requete avec Elastic Query Language
```
  {
    "query": {
      "bool": {
        "must": [
          {
            "match": {
              "tags": "vege"
            }
          }
        ]
      }
    }
  }
```

## Documantion 
### 1. Nested mode 
```
  https://stackoverflow.com/questions/13095866/elastic-search-tagging-strength-nested-child-document-boosting
```


### 2. Custorm Scror
```
  https://stackoverflow.com/questions/21439013/elasticsearch-influence-scoring-with-custom-score-field-in-document
```
