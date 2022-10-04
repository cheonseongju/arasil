$(function(){
  initCalendar();
});
/*
  달력 렌더링 할 때 필요한 정보 목록 

  현재 월(초기값 : 현재 시간)
  금월 마지막일 날짜와 요일
  전월 마지막일 날짜와 요일
*/
(function(global){
  function calendarInit() {

    // 날짜 정보 가져오기
    var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
    var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
    var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
    var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
  
    var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
    // 달력에서 표기하는 날짜 객체
  
    
    var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
    var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
    var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일
  
    // kst 기준 현재시간
    // console.log(thisMonth);
  
    // 캘린더 렌더링
    renderCalender(thisMonth);
  
    function renderCalender(thisMonth) {
  
        // 렌더링을 위한 데이터 정리
        currentYear = thisMonth.getFullYear();
        currentMonth = thisMonth.getMonth();
        currentDate = thisMonth.getDate();
  
        // 이전 달의 마지막 날 날짜와 요일 구하기
        var startDay = new Date(currentYear, currentMonth, 0);
        var prevDate = startDay.getDate();
        var prevDay = startDay.getDay();
  
        // 이번 달의 마지막날 날짜와 요일 구하기
        var endDay = new Date(currentYear, currentMonth + 1, 0);
        var nextDate = endDay.getDate();
        var nextDay = endDay.getDay();
  
        // console.log(prevDate, prevDay, nextDate, nextDay);
  
        // 현재 월 표기
        $('.year-month').text(currentYear + '.' + (currentMonth + 1));
  
        // 렌더링 html 요소 생성
        var calendar = document.querySelector('.dates')
        calendar.innerHTML = '';
        
        // 지난달
        for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
        }
        // 이번달
        for (var i = 1; i <= nextDate; i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day current">' + i + '</div>'
        }
        // 다음달
        for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
        }
  
        // 오늘 날짜 표기
        if (today.getMonth() == currentMonth) {
            todayDate = today.getDate();
            var currentMonthDate = document.querySelectorAll('.dates .current');
            currentMonthDate[todayDate -1].classList.add('today');
        }

        // todo here
        // 달력에 날짜가 클릭 됐을 때 예약 테이블의 정보를 ajax로 조회 해 온 후
        // 룸 별로 예약 가능 여부 판단 후 결과 리스트를 업데이트 해 준다
        // 예약을 하려는 날짜가 예약 테이블의 startDt와 endDt-1 사이에 존재 하는 건이 있는지 여부 및
        // 연속으로 몇박까지 가능한지를 계산 해야 함 
        calendar.addEventListener("click", (e)=>{
          let target = e.target;
          console.log(target);
          if ( target.classList.contains("prev") ){
            return;
          }
        });
    }
  
    // 이전달로 이동
    $('.go-prev').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        renderCalender(thisMonth);
    });
  
    // 다음달로 이동
    $('.go-next').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        renderCalender(thisMonth); 
    });

  }
  global.initCalendar = calendarInit;
})(window||this);

(function(){
	const roomInfoTabletbody = document.querySelector(".select_room_container .select_room_table .table tbody");
	roomInfoTabletbody.addEventListener("click", (e)=>{
          let target = e.target;
          if ( !target.classList.contains("form-check-input") ){
            return;
          }
          $.ajax({
	        type: "GET",
	        url: `./getRoomInfo`,
	        dataType: "text",
	        contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	        error: function() {
	          console.log('통신실패!!');
	        },
	        success: function(data) {
	          console.log("통신데이터 값 : " + data);
	        }
	      });
          console.log(target);
	});
})();
