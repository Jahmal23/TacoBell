require 'rails_helper'
require 'spec_helper'

RSpec.describe TacosController, :type => :controller do
  let!(:tacos) { FactoryGirl.create_list(:taco, 4) }

  describe '#index' do

    before(:each) { get :index }

    it 'assigns all tacos to @tacos' do
      expect(assigns(:tacos)).to match_array tacos
    end

    it 'is successful' do
      expect(response).to be_success
    end
  end

end