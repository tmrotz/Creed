class Plan < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :title, :subtitle, :target_title, :target_body, :financial, :action, :status

end
