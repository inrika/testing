class RemoveReferencesFromUsersReplies < ActiveRecord::Migration[5.0]
  def change
    remove_reference(:user_replies, :online_test, index: true)
    remove_reference(:user_replies, :question, index: true)
  end
end
