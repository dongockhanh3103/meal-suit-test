# MEAL SUIT
Meal suit Assignment(only Back-end)
## Usage

- Database: PostgreSql
- Rails version: 5.2.0
- Ruby version: 2.7.4

## Feature
- [X] CRUD Photo, Gallery, Comment, Tag
- [X] Search Photo, Gallery by name
- [X] Upload Photo and store it in local storage
- [X] Pagination Photo, Gallery, Comment, Tag
- [X] Sort Photo, Gallery, Comment, Tag
- [X] Versioning API

3. API

| Feature       | API           | Method        | Params        | Headers       |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| Create Resource         | /v1/:resources  | POST  | data[attributes][:field] |   |
| Update Resource         | /v1/:resources/:id  | PUT  | data[attributes][:field] |   |
| List Resource         | /v1/:resources  | GET  |  |   |
| Destroy Resource         | /v1/:resource/:id  | DELETE  | |   |
| Search Galleries         | /v1/galleries/search_by_name/  | GET  | term |   |
| Search Photos         | /v1/photos/search_by_name/  | GET  | term |   |
| Get Galleries by Tag         | /v1/tags/:id/galleries  | GET  | |   |
| Get Photos by Tag        | /v1/tags/:id/photos  | GET  |  |   |
| Tag Photo       | /v1/tags/:id/make_tag  | POST  | data[attributes][type]=Photo, data[attributes][source_id]=source_id |   |
| Tag Gallry       | /v1/tags/:id/make_tag  | POST  | data[attributes][type]=Gallery, data[attributes][source_id]=source_id |   |


## Unit Test
  - [X] Request

## Best practices
  - [X] Coverage: over 80%
  - <img width="1440" alt="image" src="https://user-images.githubusercontent.com/22610127/162117717-df0078c5-59a2-46f1-9ef9-1a6ea25cc678.png">

  - [X] Rubocop
  - [X] Unit Test
 ## Total spend time
  - 1 week (4 hours each weekday)
