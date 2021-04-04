class SchedulesBusiness
    

    def self.create(params)
       schedule = Schedule.new(params)
       can_schedule(schedule)
    end

    def self.can_schedule(schedule)
        begin
            exist_room(schedule.room) ? true : raise(I18n.t('errors.exist_room.detail'))
            weekday(schedule.date.to_date) ? true : raise(I18n.t('errors.weekday.detail'))
            hours_of_business(schedule.time_start) ? true : raise(I18n.t('errors.hours_of_business.detail'))
            room_available(schedule) ? true : raise(I18n.t('errors.room_available.detail'))
            schedule.save
            :success
        rescue => e
            return e
        end
    end

    private
    def self.exist_room(room)
        (1..4).include?(room)
    end

    def self.weekday(date)
        date.on_weekday?
    end

    def self.hours_of_business(time_start)
        time_start.between?('08:00','18:00') ? true : false
    end

    def self.room_available(schedule)
        Schedule.where(room: schedule.room, date: schedule.date.to_date, time: schedule.time_start.to_time).empty?
    end
end