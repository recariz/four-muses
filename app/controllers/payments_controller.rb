class PaymentsController < ApplicationController
  def new
    @contest_application = current_user.contest_applications.pending.find(params[:contest_application_id])
    authorize @contest_application, policy_class: PaymentPolicy
  end
end
