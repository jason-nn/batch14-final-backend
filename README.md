# hodlr backend

## Background

This is the repository for a rails app that serves as the backend for hodlr

hodlr is an app I built to automate the manual process I used to track crypto prices against my average buying price. While the average buying price and acquisition cost calculations could be automated with Google Sheets or Excel formulas, I had to manually update the coin prices every day by copying and pasting the prices. I built hodlr so I would no longer have to do that. hodlr is able to automate not only the calculations, but the current price updates as well.

## Installation and Setup

```console
git clone git@github.com:jason-nn/batch14-final-backend.git
```

```console
cd batch14-final-backend
```

```console
bundle install
```

```console
yarn install --check-files
```

```console
bundle exec rails webpacker:install
```

```console
rails db:create
```

```console
rails db:migrate
```

```console
rails server -p 4000
```

## Routes

```console
post api/v1/sessions

# receives user email and password
# returns user password, user id, and a token to be used for authorization
```

```console
post api/v1/registrations

# receives user email and password
# creates the user in the database
# returns user password, user id, and a token to be used for authorization
```

```console
get api/v1/cryptocurrencies

# returns all cryptocurrency data
```

```console
get api/v1/cryptocurrencies/symbols

# returns all symbols from coingecko database
```

```console
get api/v1/cryptocurrencies/:symbol

# returns data for cryptocurrency with symbol :symbol
```

```console
get api/v1/purchases

# returns data for all purchases that belong to the current user
```

```console
post api/v1/purchases

# receives cryptocurrency id, price, and quantity
# creates a new purchase
# returns data for created purchase
```

```console
get api/v1/alerts

# returns data for all alerts that belong to the current user
```

```console
post api/v1/alerts

# receives cryptocurrency id, price, and quantity
# creates a new alert
# returns data for created alert
```

```console
delete api/v1/alerts/:id

# deletes alert with id :id
```
