class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through :subscriptions

  def email_list
    emails = readers.pluck(:email)
    emails.join(";")
  end

  def self.most_popular
    subscribers_with_count = Magazine.all.map do |magazine|
      magazine.subscriptions.count 
    end.max
    Magazine.all.find {|magazine|}
  end
end