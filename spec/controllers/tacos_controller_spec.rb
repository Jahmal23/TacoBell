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

  describe '#destroy' do
    context 'when the taco exists' do
      before(:each) { delete :destroy, id: tacos[0].id }

      it 'is successful' do
        expect(response).to be_success
      end

      it 'throws out the taco' do
        expect(Taco.all).not_to include tacos[0]
        expect { tacos[0].reload }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end

end