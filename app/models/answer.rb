class Answer < ActiveRecord::Base

  after_create : create_feed_content

  belongs_to :question
  belongs_to :user
  has_one :feed_content, as: :content, dependet: :destroy

  private
  def create_feed_content
    self.feed_content = FeedContent.create(group_id: group_id, updated_at: updated_at)
  end
end