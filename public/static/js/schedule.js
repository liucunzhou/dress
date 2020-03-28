Date.prototype.getFirstDay = function () {
    var year = this.getFullYear();
    var month = this.getMonth();
    var d = new Date(year, month, 1);
    return d;
};

Date.prototype.getLastDate = function () {
    var year = this.getFullYear();
    var month = this.getMonth() + 1;
    var d = new Date(year, month, 0);
    return d;
};

(function ($) {

    $.fn.schedule = function (options) {
        var defaults = {
            startDate: '',
            color: "white",
            'background-color': "#556b2f"
        };
        var _ = $.extend({}, defaults, options);

        var weekText = ['周日', '周一', '周二', '周三', '周四', '周五', '周六'];
        var renderCalendarHeder = function (startDate) {
            var calendarLeftBtns= '<div class="c-btn-left"><div class="c-btn c-today">今天</div></div>';
            var calendarRightBtns= '<div class="c-btn-right"><div class="c-btn c-pre-month">上一月</div><div class="c-btn c-next-month">下一月</div></div>';
            var calendarToday = `<div class="calendar-title">${startDate}</div>`;

            return `<div class="calendar-header">${calendarLeftBtns}${calendarToday}${calendarRightBtns}</div>`;
        }

        var renderCalendarWeeks = function () {
            var calendarWeeks = '<tr>';
            weekText.forEach(function (value, key) {
                calendarWeeks += `<td>${value}</td>`;
            });
            calendarWeeks += "</tr>";

            return calendarWeeks;
        }

        var renderCalendarBody = function (startDate) {
            var date = new Date(startDate);    
            var dateStamp = date.getTime();

            var calendarBody = '<tr>'
            // 当月的第一天
            var firstDate = date.getFirstDay();
            var firstStamp = firstDate.getTime();
            var lastDate = date.getLastDate();
            var lastStamp = lastDate.getTime();
            // 初始化日历提一天的时间戳
            var cstamp = firstDate.getTime() - 86400000 * firstDate.getDay();
            var i = 1;

            for (i; i < 43; i++) {
                var cdate = new Date(cstamp);
                var cday = cdate.getDate();
                if (cstamp < firstStamp) {
                    var tdStyle = 'gone';
                } else if (cstamp > lastStamp) {
                    var tdStyle = 'coming';
                } else {
                    var tdStyle = 'current';
                }

                var td = `<td class="c-day ${tdStyle}" data-stamp="${cstamp}">${cday}</td>`;

                if (i % 7 != 0) {
                    calendarBody += td;
                } else if (i % 7 == 0) {
                    if (i == 42) {
                        calendarBody += `${td}</tr>`;
                    } else {
                        calendarBody += `${td}</tr><tr>`;
                    }
                }
                cstamp += 86400000;
            }

            return calendarBody;
        }

        var renderCalendar = function (startDate) {
            var calendarHeder = renderCalendarHeder(startDate);
            var calendarWeeks = renderCalendarWeeks();
            var calendarBody = renderCalendarBody(startDate);
            var calendar = `${calendarHeder}<table class="table table-bordered"> ${calendarWeeks} ${calendarBody}</table>`;

            return calendar;
        }


        // public methods
        this.initialize = function () {
            this.render(_.startDate);
            this.each(function(){
                var calendar = this;
                $(calendar).find(".c-btn").click(function(){
                    alert(10);
                });

                $(calendar).find(".c-day").click(function(){
                    var cstamp = parseInt($(this).attr('data-stamp'));
                    var cdate = new Date(cstamp);
                    var cdateFormated = cdate.getFullYear() + '-' + (cdate.getMonth() + 1) + '-' + cdate.getDate();
                    $(calendar).find(".calendar-title").html(cdateFormated);
                });
            });

            return  this;
        };

        this.render = function(startDate) {
            var canlendar = renderCalendar(startDate);
            this.html(canlendar);

            return this;
        }

        return this.initialize();
    }

})(jQuery);