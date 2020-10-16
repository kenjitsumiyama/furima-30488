## users table

| Column               | Type                | Options                 |
|----------------------|---------------------|-------------------------|
| nickname             | string              | null: false             |
| email                | string              | null: false             |
| password             | string              | null: false             |
| password_confirmation| string              | null: false             |
| last_name            | string              | null: false             |
| fast name            | string              | null: false             |
| last_name_kana       | string              | null: false             |
| fast name_kana       | string              | null: false             |
| birth_date_1         |                     | null: false             |
| birth_date_2         |                     | null: false             |
| birth_date_3         |                     | null: false             |
### Association

* has_many :items
* has_many :Purchases

## items table

| Column                              | Type        | Options           |
|-------------------------------------|-------------|-------------------|
| image                               |ActiveStorage| null: false       |
| name                                | text        | null: false       |
| info                                | text        | null: false       |
| category                            |             | null: false       |
| condition                           |             | null: false       |
| shipping                            |             | null: false       |
| prefecture                          |             | null: false       |
| scheduled_delivery                  |             | null: false       |
| price                               | integer     | null: false       |
| user                                | references  | foreign_key: true |

### Association

- belongs_to :user
- has_one : purchase

## purchases table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| card_number | integer    | null: false       |
| exp_month   | integer    | null: false       |
| exp_year    | integer    | null: false       |
| cvc_code    | integer    | null: false       |
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association

- belongs_to :items
- belongs_to :user
- has_one : address

### addresses table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| prefecture  |            | null: false       |
| city        | string型   | null: false       |
| address     | string型   | null: false       |
| building    | string型   | null: false       |
| phone_number| integer型  | null: false       |
| purchase    | references | foreign_key: true |

- belongs_to :purchase


