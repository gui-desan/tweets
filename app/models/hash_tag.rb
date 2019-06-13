class HashTag < ApplicationRecord
  def tweets
    Tweet.where("'#{name}' = ANY(hash_tags)")
  end
end
