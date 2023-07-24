class DailyWineCheckJob < ApplicationJob
  queue_as :default

  def perform
    new_wines = Wine.where("created_at >= ?", Time.zone.now.beginning_of_day)

    new_wines.each do |wine|
      matching_alerts = Alert.where(variety: wine.variety)
                             .or(Alert.where(designation: wine.designation))
                             .or(Alert.where(domain: wine.domain))

      matching_alerts.each do |alert|
        UserMailer.with(user: alert.user, wine: wine).new_wine_alert.deliver_now
      end
    end
  end
end
