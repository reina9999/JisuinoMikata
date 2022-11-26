class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true #対応するデータベースのテーブルを用意しない
end
