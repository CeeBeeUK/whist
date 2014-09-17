class Status < ActiveRecord::Base
  validates :name, presence: true

	#{name: 'Unstarted'}, {name:'In progress'},{name:'Complete'}
  def self.unstarted
    find_by_status(self.UNSTARTED)
  end

  def self.in_progress
    find_by_status(self.IN_PROGRESS)
  end

  def self.complete
    find_by_status(self.COMPLETE)
  end

  def self.find_by_status(type)
    Status.find_by_name(type)
  end

  def self.UNSTARTED
    'Unstarted'
  end
  
  def self.IN_PROGRESS
    'In progress'
  end

  def self.COMPLETE
    'Complete'
  end
end
