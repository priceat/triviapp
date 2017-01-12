class Question < ActiveRecord::Base
has_many :answers, dependent: :destroy
has_many :user_answers
accepts_nested_attributes_for :answers

   CATEGORIES = {
   "Sports" => "sports",
   "Politics" => "politics",
   "Fashion" => "fashion",
   "Pop Culture" => "pop culture"
  }

end
