class Api::ShouldRetainController < ApiController
  def index
    plan_name = params[:plan].capitalize
    date = params[:date]

    should_retain = ShouldRetainService.verify(plan_name, date)

    return render status: 500, json: { exception: should_retain } if should_retain.is_a?(String)
    
    render status: 200, json: { should_retain: should_retain }
  end
end
