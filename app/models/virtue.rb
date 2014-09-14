class Virtue < ActiveRecord::Base
  before_save { self.name = format_name(name) }
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 20 }

  private
    def format_name(name)
      name = name.gsub(/[^\w\s]/, "")
      name = name.split(" ").map { |word| word.camelcase }
      name = name.join(" ")
    end
end
