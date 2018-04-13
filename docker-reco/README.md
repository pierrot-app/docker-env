### Exec mapping
PUT /products
{

}

### Load data
POST /products/doc/${id}
{
    
}

### Index patterns
products*

### Request Lucene query
tags:vege AND sportif AND key:"carotte" AND time:"maintenant" AND status:"recette"
time:maintenant AND tags:vege AND sportif
input:recette AND maintenant AND carotte AND sportif
input:recette maintenant carotte vege, sportif

### Request Elastic query
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

### Nested mode 
https://stackoverflow.com/questions/13095866/elastic-search-tagging-strength-nested-child-document-boosting


### Custorm Scror
https://stackoverflow.com/questions/21439013/elasticsearch-influence-scoring-with-custom-score-field-in-document
