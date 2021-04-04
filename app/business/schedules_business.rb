class SchedulesBusiness
    
    def initialize(params)
       room = params[:room]
       date = params[:date].to_date
       time_start = params[:time_start].to_time
       time_end = params[:time_end].to_time
       user_id = params[:user_id]

        can_schedule(room, date, time_start, time_end, user_id)
    end

    def can_schedule(room, date, time_start, time_end, user_id)
        exist_room(room)
        weekday(date)
        hours_of_business(time_start)
        room_available(room, date, time_start)
    end

    private
    def exist_room(room)
        raise(I18n.t('errors.exist_room')) unless (1..4).include?(room)
    end

    def weekday(date)
        raise(I18n.t('errors.weekday')) unless date.on_weekday?
    end

    def hours_of_business(time_start)
        raise(I18n.t('errors.hours_of_business')) unless ("09:00".to_time.."18:00".to_time).include?(time_start)
    end

    def room_available(room, date, time_start)
        raise(I18n.t('errors.room_available')) unless Schedule.where(room: room, date: date, time: time_start).empty?
    end
end