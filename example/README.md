# SQLx CLI Example

Here is a simple example to demonstrate how to use this image to setup a database.

Note: Because the command is running inside a Docker container, so be mindful of the network setup. I use `--network host` here to bypass this issue.

```sh
cd example

# run a database
docker compose up -d

# run `sqlx database setup`
docker run --rm -it --network host -v ./migrations:/migrations uima/sqlx-cli:latest sqlx database setup --source /migrations --database-url postgres://postgres:password1234@localhost/test_db

# check result
docker compose exec -it postgres psql -U postgres -d test_db -c 'select * from items;'

# close the database
docker compose down
```
