class TacoToSide < ActiveRecord::Base
  belongs_to :taco
  belongs_to :side
end
