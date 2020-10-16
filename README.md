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
| image                               |             | null: false       |
| name                                | string      | null: false       |
| info                                | text        | null: false       |
| category_id                         | integer     | null: false       |
| condition_id                        | integer     | null: false       |
| shipping_id                         | integer     | null: false       |
| prefecture_id                       | integer     | null: false       |
| scheduled_delivery_id               | integer     | null: false       |
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

- belongs_to :item
- belongs_to :user
- has_one : address

### addresses table

| Column        | Type        | Options           |
|-------------  |-------------|------------------ |
| postal_code   |             | null: false       |
| city          |             | null: false       |
| address       |             | null: false       |
| building      |             |                   |
| prefecture_id | integer     | null: false       |
| phone_number  |             | null: false       |
| purchase      | references  | foreign_key: true |

### Association

- belongs_to :purchase


