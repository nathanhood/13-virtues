class Virtue < ActiveRecord::Base
  before_save { self.name = format_name(name) }
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 20 }

  has_many :virtue_reports
  has_many :daily_reports, through: :virtue_reports

  def calculate_monthly_virtue_average(user)
    total = 0
    recent = self.daily_reports.where("daily_reports.user_id = ? AND daily_reports.created_at >= ?", user.id, 30.days.ago)
    recent.each do |report|
      virtue_report = report.virtue_reports.where(virtue: self).first
      if virtue_report
        total += virtue_report.rating
      end
    end

    average = total / recent.length
    virtue_avg = { name: self.name, data: [average] }
  end

  def calculate_total_virtue_average(user)
      total = 0
      self.daily_reports.where("daily_reports.user_id = ?", user.id).each do |report|
        virtue_report = report.virtue_reports.where(virtue: self).first
        if virtue_report
          total += virtue_report.rating
        end
      end
      average = (total.to_f / user.daily_reports.length.to_f).round(2)
      virtue_avg = { name: self.name, average: average }
  end

  def self.calculate_virtue_percentage(averages)
    sum = 0
    final = []

    averages.each do |avg|
      sum += avg[:average]
    end

    averages.each do |avg|
      array = []
      average = (avg[:average].to_f / sum * 100).round(2)
      array.push(avg[:name])
      array.push(average)
      final.push(array)
    end
    final
  end

  private
    def format_name(name)
      name = name.gsub(/[^\w\s]/, "")
      name = name.split(" ").map { |word| word.camelcase }
      name = name.join(" ")
    end
end
