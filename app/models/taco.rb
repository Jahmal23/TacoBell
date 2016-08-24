class Taco < ActiveRecord::Base
  belongs_to :meat
  has_many :taco_to_sides, :dependent => :destroy
  has_many :sides, :through => :taco_to_sides

  def taco_meat
    self.meat.name unless self.meat.nil?
  end

  def has_rice
    rice = self.taco_to_sides.find_by(side:1)
    not rice.nil?
  end

  def has_salsa
    salsa = self.taco_to_sides.find_by(side:2)
    not salsa.nil?
  end

end
