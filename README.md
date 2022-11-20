# README

1. To generate a migration file <br>
`rails generate migration create_users` 

2. To run the migration <br>
`rails db:migrate`

3. To undo/rollback last migration <br>
`rails db:rollback`

4. To create a controller <br>
`rails generate controller users`

5. Add new column to a table

`rails generate migration add_user_to_articles`
```rails
class AddUserToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :user_id, :int
  end
end
```

6. To create a controller
`rails generate controller users`



