# NAMI AI
url-shortener
## Usage

- Database: PostgreSql
- Rails version: 7.0.2
- Ruby version: 3.0.0
- Domain: https://url-shortener-qlkuok.herokuapp.com/

## Feature
- [X] Encode URL
- [X] Decode

## Tasks
### You need to think through potential attack vectors on the application:
| Vector     | Description       | Solution      |
| ------------- | ------------- | ------------- |
| DDOS   |  Attack requires an attacker to gain control of a network of online machines in order to carry out an attack       | Limit request rate, White list address, Limit connections...      |
| SQL Injection      | Inject danger query in parameters       | Use Strong parameter in rails     |
| External domain request to server      |       | White list address, CORS, use authorization token    |
| Main in ther middle      |    Catch information of message in each request   | HTTPS    |
| Unencrypted Communications     |   do not encrypts the data exchange between the client and the server   | TTPS    |


## API
Default authorization token on Prod: 80c179c4a4b0fb2ab68fab42c147f949ae0c8744af392bc81dd8cf934401941574100870767285e93acdd39c5697cf1a5e8e1f4e733ac0a9822c2e1d8e71ef79

| Feature       | API           | Method        | Params        | Headers       |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| Encode URL       | /v1/links/encode  | POST  | data[attributes][:original_url] |  authorization  |
| Decode URL        | /v1/links/:slug/decode  | GET  |  |   |

## Unit Test
  - [X] Request
  - [X] Model
  - [X] Service

## Best practices
  - [X] API implemented featuring a /encode and /decode endpoint
  - [X] Completeness
  - [X] Correctness
  - [X] Maintainability
  - [X] Coverage: over 80%
  - [X] Rubocop
  - [X] Unit Test
  - [X] Go live production

