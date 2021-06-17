class User < ApplicationRecord
  has_many :scores

  def current_submission
    scores.where(submitted_at: nil).last
  end

  def submitted_scores
    scores.where.not(submitted_at: nil)
  end
end
