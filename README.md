# Movies-API REST

| METHOD | URL | CODE |
| ------------ | ------------ | ------------ |
| GET | /comments | 200 |
| GET | /comments/:ID | 200 |
| POST | /comments | 201 |
| PUT | /comments/:ID | 200 |
| DELETE | /comments/:ID | 200 |

### METHODS - POSTMAN

![api methods postman](https://i.imgur.com/6ZkVLSQ.png "api methods postman")

#### PAGINATION

Add query params to GET request: 
- `/comments?page=1&limit=10`

#### SORTING

Add query params to GET request: 
- `/comments?sortBy=user_id&order=DESC`

- Order **always** in uppercase

#### FILTERING

Add query params to GET request: 
- `/comments?rating=1`  - search by `rating` field on all comments

- **Only** filtering by rating is supported

- Value 1 - 5

