class Mypage::ActivitiesController < Mypage::BaseController
  def index
    @activities = current_user.activities.order(created_at: :desc)
  end
end
