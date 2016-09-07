require 'rails_helper'
require 'spec_helper'

RSpec.describe TacosController, :type => :controller do
  let!(:tacos) { FactoryGirl.create_list(:taco, 4) }
  let!(:taco_attrs) { FactoryGirl.attributes_for(:taco) }
  let!(:previous_count) { Taco.count }

  describe '#index' do
    before(:each) { get :index }

    it 'assigns all tacos to @tacos' do
      expect(assigns(:tacos)).to match_array tacos
    end

    it 'is successful' do
      expect(response).to be_success
    end

    it 'responds with JSON' do
      expect {
        JSON.parse(response.body)
      }.to_not raise_error
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

  describe '#create' do
    context 'has valid attributes' do
      before(:each) do
        taco_attrs =  {"notes"=>"werwesdf", "meat"=>"Chicken", "has_rice"=>true, "has_salsa"=>true}
        post :create, taco_attrs
      end

      it 'is successful' do
        expect(response).to be_success
      end

      it 'creates a new taco' do
        #should increment
        expect(Taco.count).to eq(previous_count + 1)

        taco = assigns(:taco)

        expect(taco.taco_to_sides).not_to be_nil
        expect(taco.taco_to_sides.count).to   eq(2) #both rice and salsa added to order

        expect(taco.meat).not_to be_nil
        expect(taco.meat.name).to eq("Chicken")
      end

      it 'responds with JSON' do
        expect {
          JSON.parse(response.body)
        }.to_not raise_error
      end
    end
  end

end