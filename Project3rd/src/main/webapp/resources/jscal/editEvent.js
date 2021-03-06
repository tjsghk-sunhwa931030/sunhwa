/* ****************
 *  일정 편집

 * ************** */

var editEvent = function (event, element, view) {
	
    $('.popover.fade.top').remove();
    $(element).popover("hide");

    if (event.allDay === true) {
        editAllDay.prop('checked', true);
    } else {
        editAllDay.prop('checked', false);
    }

    if (event.end === null) {
        event.end = event.start;
    }

    if (event.allDay === true && event.end !== event.start) {
         editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
    } else {
        editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    }

    modalTitle.html('일정 수정');
    editId.val(event._id); //고유아이디를 받아오기위해 추가
    editTitle.val(event.title);
    editStart.val(event.start.format('YYYY-MM-DD HH:mm'));
    editType.val(event.type);
    editDesc.val(event.description);
    editColor.val(event.backgroundColor).css('color', event.backgroundColor);

    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');

    //업데이트 버튼 클릭시
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () {

        if (editStart.val() > editEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (editTitle.val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }

        var statusAllDay;
        var startDate;
        var endDate;
        var displayDate;

        if (editAllDay.is(':checked')) {
            statusAllDay = true;
            startDate = moment(editStart.val()).format('YYYY-MM-DD');
            endDate = moment(editEnd.val()).format('YYYY-MM-DD');
            displayDate = moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD');
            displayDate = moment(editEnd.val()).format('YYYY-MM-DD');
        } else {
            statusAllDay = false;
            startDate = editStart.val();
            endDate = editEnd.val();
            displayDate = endDate;
        }

        eventModal.modal('hide');

        event.allDay = statusAllDay;
        event.title = editTitle.val();
        event.start = startDate;
        event.end = displayDate;
        event.type = editType.val();
        event.backgroundColor = editColor.val();
        event.description = editDesc.val();
        event.id = editId.val(); //고유아이디를 받아오기 위해 추가

        $("#calendar").fullCalendar('updateEvent', event);

        //일정 업데이트
        $.ajax({
            type: "get",
            url: "editcal.do",
            dataType : "json",
            data: {
            	id : event.id,
            	title: event.title,
                start: event.start,
                end: event.end,
                description: event.description,
                type: event.type,
                backgroundColor: event.backgroundColor,
                allDay: event.allDay
            },
            success: function (response) {
            	
            	//var message = "<c:out value='${msg}'/>";
            	//alert("수정이 완료되었습니다.");
            	alert(response.message);
            	if(response.message=='수정할 수 없습니다.'){
            		location.reload();
            	}
                
            }
        });

    });

    // 삭제버튼
    $('#deleteEvent').on('click', function () {
        $('#deleteEvent').unbind();
        $("#calendar").fullCalendar('removeEvents', [event._id]);
        eventModal.modal('hide');
        
        event.id = editId.val(); //고유아이디를 받아오기 위해 추가

        //삭제시
        $.ajax({
            type: "get",
            url: "deletecal.do",
            data: {
                id : event.id
            },
            success: function (response) {
                alert('삭제되었습니다.');
            }
        });
    });
};