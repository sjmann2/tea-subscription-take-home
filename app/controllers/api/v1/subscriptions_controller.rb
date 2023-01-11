class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new(subscription_params)
   
    if subscription.save && params[:teas].present?
      render json: SubscriptionSerializer.new(subscription), status: 201
      params[:teas].each do |tea|
        SubscriptionTea.create!(tea_id: tea, subscription_id: subscription.id)
      end
    else
      render json: "Error: Parameter missing", status: 400
    end
  end

  def index
    subscriptions = Customer.find(params[:customer_id]).subscriptions
    render json: SubscriptionSerializer.new(subscriptions), status: 200
  end

  def update
    subscription = Subscription.find(params[:subscription_id])
    subscription.update!(subscription_params)
    render json: SubscriptionSerializer.new(subscription), status: 200
  end

  private

  def subscription_params
    params.permit(:customer_id, :title, :frequency, :status, :price)
  end
end