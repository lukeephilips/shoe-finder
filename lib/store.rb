class Store < ActiveRecord::Base
  has_and_belongs_to_many :shoes

  before_save(:to_titlecase)
  validates(:name, {:presence => true})
  validates :name, uniqueness: { case_sensitive: false }

private

  define_method(:to_titlecase) do
    self.name =(name().titlecase())
  end
end
