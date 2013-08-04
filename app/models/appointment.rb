class Appointment < ActiveRecord::Base
  validates :email, :name, :phone, :time, presence: true

  def first_name
    @first_name = name.split(' ')[0]
  end
end
