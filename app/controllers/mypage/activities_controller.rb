class Mypage::ActivitiesController < Mypage::BaseController
  def index
    @activities = current_user.activities.find(params[:id])
  end
end
