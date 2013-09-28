# class EmailValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
#       record.errors[attribute] << " is not a valid email"
#     end
#   end
# end

class Appointment < ActiveRecord::Base
  validates :email, :name, :phone, :time, :reason, presence: true
  # validates :email, presence: true, email: true

  def first_name
    @first_name = name.split(' ')[0]
  end
end
