require 'stripe_mock'

RSpec.describe 'POST api/subscription', type: :request do
    let!(:stripe_helper) { StripeMock.create_test_helper }
    before(:each) { StripeMock.start }
    after(:each) { StripeMock.stop }

    let(:card_token) { stripe_helper.generate_card_token }
    let(:invalid_token) { "12345678910" }

    let(:product) {stripe_helper.create_product}
    let(:plan) { stripe_helper.create_plan(
        id: 'platinum_plan',
        amount: 1000000,
        currency: 'usd',
        interval: 'month',
        interval_count: 12,
        name: ''
        product: product.id
    )}

    let(:user) { create(:user, role: 'registered_user') }
    let(:user_credentials) { user.create_new_auth_token }
    let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials) }
  
    describe "User buys subscription" do
    before do
        post '/api/subscriptions',
        params: {
            stripeToken: card_token,
            email: "user@mail.com"
        }
        headers: headers
        user.reload
    end

    it "check if subcription route is there" do
        expect(response.status).to eq 200
    end

    it "check if user bought a subcription" do
        expect(response_json['status']).to eq "Transaction cleared"
    end

    it 'creates or retrieves a customer on stripe' do
        expect(Stripe::Customer.list.data.first.email).to eq ''
    end
  end

#   describe "Unsuccessfully invalid token" do
#     before do
#         post '/api/subscriptions',
#         params: {
#             stripeToken: invalid_token,
#             email: "user@mail.com"
#         }
#         headers: headers
#         user.reload
#     end

#     it "check if subcription route is there" do
#         expect(response.status).to eq 400
#     end

#     it "check if user bought a subcription" do
#         expect(response_json['status']).to eq "paid"
#     end

#     it 'creates or retrieves a customer on stripe' do
#         expect(Stripe::Customer.list.data.first.email).to eq ''
#     end
#   end

#   describe "Without token" do
#     before do
#         post '/api/subscriptions',
#         params: {
#             stripeToken: "",
#             email: "user@mail.com"
#         }
#         headers: headers
#         user.reload
#     end

#     it "check if subcription route is there" do
#         expect(response.status).to eq 200
#     end

#     it "check if user bought a subcription" do
#         expect(response_json['status']).to eq "paid"
#     end

#     it 'creates or retrieves a customer on stripe' do
#         expect(Stripe::Customer.list.data.first.email).to eq ''
#     end
#   end

#   describe "When user is not login" do
#     before do
#         post '/api/subscriptions',
#         params: {
#             stripeToken: card_token,
#         }
#     end

#     it "check if subcription route is there" do
#         expect(response.status).to eq 200
#     end

#     it "check if user bought a subcription" do
#         expect(response_json['status']).to eq "paid"
#     end

#     it 'creates or retrieves a customer on stripe' do
#         expect(Stripe::Customer.list.data.first.email).to eq ''
#     end
#   end

#   describe "When stripe declines subscription for user" do
#     before do

#         custom_error = StandarError.new("Subscription couldn't be created")
#         StripeMock.prepare_error(custom_error, :create_subscription )
#         post '/api/subscriptions',
#         params: {
#             stripeToken: card_token,
#             email: user.email
#         }
#         headers: headers
#         user.reload
#     end

#     it "check if subcription route is there" do
#         expect(response.status).to eq 400
#     end

#     it "returns error message" do
#         expect(response_json['status']).to eq "paid"
#     end
#   end
end