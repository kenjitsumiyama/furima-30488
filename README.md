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
| birth_date           | date                | null: false             |

### Association

* has_many :items
* has_many :Purchases

## items table

| Column                              | Type        | Options           |
|-------------------------------------|-------------|-------------------|
| image                               |activestorage| null: false       |
| name                                | text        | null: false       |
| info                                | text        | null: false       |
| category_id                         |active hash  | null: false       |
| condition_id                        |active hash  | null: false       |
| shipping_id                         |active hash  | null: false       |
| prefecture_id                       |active hash  | null: false       |
| scheduled_delivery_id               |active hash  | null: false       |
| price                               | integer     | null: false       |
| user                                | references  | foreign_key: true |

### Association

- belongs_to :user
- has_one : purchase

## purchases table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association

- belongs_to :items
- belongs_to :user
- has_one : address

### addresses table

| Column        | Type        | Options           |
|-------------  |-------------|------------------ |
| prefecture_id | active hush | null: false       |
| city          | string型    | null: false       ｜
| address       | string型    | null: false       |
| building      | string型    | null: false       |
| phone_number  | integer型   | null: false       |
| purchase      | references  | foreign_key: true |

### Association

- belongs_to :purchase


