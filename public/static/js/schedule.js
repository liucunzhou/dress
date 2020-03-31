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

// 获取上个月日期
Date.prototype.getLastMonth = function () {
    var year = this.getFullYear();
    var month = this.getMonth();
    if (month == 0) {
        year = year - 1;
        month = 12;
    }

    return year + "-" + month + "-" + "1";
};

Date.prototype.getNextMonth = function (){
    var year = this.getFullYear();
    var month = this.getMonth() + 1;
    if(month == 12){
        month = 1;
        year = year + 1;
    } else {
        month = month + 1;
    }

    return year + "-" + month + "-" + "1";
};

(function ($) {

    $.fn.schedule = function (options) {
        var defaults = {
            initDate: '',
            startDate:'',
            endDate:'',
            color: "white",
            'background-color': "#556b2f"
        };
        var config = $.extend({}, defaults, options);

        var weekText = ['周日', '周一', '周二', '周三', '周四', '周五', '周六'];
        var renderCalendarHeder = function (initDate) {
            var calendarLeftBtns = '<div class="c-btn-left"><div class="c-btn c-today">今天</div></div>';
            var calendarRightBtns = '<div class="c-btn-right"><div class="c-btn c-last-month">上一月</div><div class="c-btn c-next-month">下一月</div></div>';
            var calendarToday = `<div class="calendar-title">${initDate}</div>`;

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

        var renderCalendarBody = function (initDate) {
            var date = new Date(initDate);
            var dateStamp = date.getTime();
            var startStamp = config.startDate == '' ? 0 : (new Date(config.startDate)).getTime();
            var endStamp =  config.endDate == '' ? 0 : (new Date(config.endDate)).getTime();
            var calendarBody = '<tr>'
            // 当月的第一天
            var firstDate = date.getFirstDay();
            var firstStamp = firstDate.getTime();
            var lastDate = date.getLastDate();
            var lastStamp = lastDate.getTime();
            // 初始化日历提一天的时间戳
            var cstamp = firstDate.getTime() -86400000 * firstDate.getDay();
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

                console.log(cstamp, startStamp);
                if(cstamp + 28800001 > startStamp && cstamp < endStamp + 1) {
                    var td = `<td class="c-day ${tdStyle} using" data-stamp="${cstamp}"><span class="c-date">${cday}</span></td>`;
                } else {
                    var td = `<td class="c-day ${tdStyle}" data-stamp="${cstamp}"><span class="c-date">${cday}</span></td>`;
                }

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

        var renderCalendar = function () {
            var initDate = config.initDate;
            var calendarHeder = renderCalendarHeder(initDate);
            var calendarWeeks = renderCalendarWeeks();
            var calendarBody = renderCalendarBody(initDate);
            var calendar = `${calendarHeder}<table class="table table-bordered"> ${calendarWeeks} ${calendarBody}</table>`;
            return calendar;
        }


        var _ = this;
        // public methods
        this.initialize = function () {
            this.render();
            return this;
        };

        this.render = function () {
            var canlendar = renderCalendar();
            this.html(canlendar);
            this.each(function () {
                var calendarTitle = $(calendar).find(".calendar-title");
                var initDateObj = new Date(config.initDate);

                $(calendar).find(".c-btn").click(function () {
                    if ($(this).hasClass("c-today")) {

                        var today = new Date();
                        config.initDate = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
                        _.render();

                    } else if ($(this).hasClass("c-last-month")) { 
                        config.initDate = initDateObj.getLastMonth();
                        console.log(config.initDate);
                        _.render();

                    } else if ($(this).hasClass("c-next-month")) {
                        console.log(config.initDate);
                        config.initDate = initDateObj.getNextMonth();
                        _.render();
                    } else {
                        // 
                    }
                });

                $(calendar).find(".c-day").click(function () {
                    var cstamp = parseInt($(this).attr('data-stamp'));
                    var cdate = new Date(cstamp);
                    var cdateFormated = cdate.getFullYear() + '-' + (cdate.getMonth() + 1) + '-' + cdate.getDate();
                    $(calendar).find(".calendar-title").html(cdateFormated);
                });
            });

            return this;
        }

        return this.initialize();
    }

})(jQuery);