class ApiKey < ApplicationRecord
  self.table_name = 'user_api_keys'
  belongs_to :user
end