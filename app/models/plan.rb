class Plan < ActiveRecord::Base

  validates_presence_of :title, :body, :conclusion

end
