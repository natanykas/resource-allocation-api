class SchedulesBusiness

  def self.create(schedule)
    can_schedule(schedule)
  end

  def self.can_schedule(schedule)
    begin
      exist_room(schedule.room) ? true : raise(I18n.t('errors.exist_room.detail'))
      weekday(schedule.date.to_date) ? true : raise(I18n.t('errors.weekday.detail'))
      hours_of_business(schedule.time_start) ? true : raise(I18n.t('errors.hours_of_business.detail'))
      valid_user(schedule.user_id) ? true : raise(I18n.t('errors.valid_user.detail'))
      room_available(schedule) ? true : raise(I18n.t('errors.room_available.detail'))
      schedule.save
      :success
    rescue => e
      return e
    end
  end

  def self.exist_room(room)
    (1..4).include?(room)
  end

  def self.weekday(date)
    date.on_weekday?
  end

  def self.hours_of_business(time_start)
    time_start.strftime('%H:%M').between?('08:00', '18:00') ? true : false
  end

  def self.valid_user(user_id)
    User.where(id: user_id).any?
  end

  def self.room_available(schedule)
    Schedule.where(room: schedule.room, date: schedule.date.to_date, time_start: schedule.time_start.to_time).empty?
  end

  private_class_method :exist_room, :weekday, :hours_of_business, :valid_user, :room_available
end
