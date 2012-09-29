# coding: utf-8

class TvDrama
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::BaseModel
  include Mongoid::TaggableOn
  include Mongoid::Likeable
  # include Mongoid::CounterCache

  field :tv_name, :type => String
  field :alias_name, :type => String, :default => ''
  field :cover, :type => String

  taggable_on :alias_names
  taggable_on :actors
  taggable_on :categories
  taggable_on :directors

  field :tv_station  
  field :release_date, :type => Time
  field :imdb
  field :summary
  field :topics_count, :type => Integer, :default => 0
  # field :download_resources_count, :type => Integer, :default => 0 
  field :verify, :type => Boolean, :default => false
  field :created_by, :type => String, :default => ''
  field :last_edit_by, :type => String, :default => ''

  index :verify => 1

  mount_uploader :cover, CoverUploader

  has_many :topics
  has_many :pre_releases

  validates :tv_name, :presence => true, :uniqueness => true
  validates_presence_of :cover

end