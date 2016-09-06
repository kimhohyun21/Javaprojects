/**
 * Created by sist on 2016-09-06.
 */

//플레이어의 프로퍼티로 문자열 값을 반환하는 함수 추가
Player.prototype.toString=function(){
    //플레이어의 point값에 따라 가위, 바위, 보 문자열 반환
    switch (this.point){
        case 0:
            return '가위';
            break;
        case 1:
            return '바위';
            break;
        case 2:
            return '보';
            break;
    }
}

//가위, 바위, 보를 구분하는 숫자인자(point)를 가지는 플레이어 생성
function Player(p){
    if(!p){
        p=0
    };
    this.point=p;
}

function getEventSource(evt){
    //이벤트가 실행된 타겟이 있으면 타겟값 반환 ex) 가위 : btnScissors, 바위 : btnRock, 보 : btnPaper
    if (evt.target) {
        return evt.target;
    }else{
        return window.event.srcElement;
    }
}
//evt를 파라미터로 받아서 실행
function playRockScissorsPaper(evt){
    //evt라는 이벤트를 파라미터 값을 받아서 getEventSource()함수 실행
    var source=getEventSource(evt);
    //이벤트가 실행된 타켓이 무엇인지 반환 받는다

    //플레이어를 생성
    var player=new Player();
    //플레이어가 실행한 이벤트의 타겟값을 반환 받아 switch문 구동
   switch(source.id){
        case 'btnScissors':
            player.point=0;
            break;
        case 'btnRock':
            player.point=1;
            break;
        case 'btnPaper':
            player.point=2;
            break
    }

    //플레이어를 상속받은 컴퓨터 생성
    var computer=new Player(Math.floor(Math.random()*3));
    //Math.floor는 가장 가까운 정수를 리턴, computer는 랜덤으로 0, 1, 2값을 가짐

    //결과값을 출력할 Element생성
    var resultElement=document.getElementById('result');

    //플레이어와 컴퓨터의 point를 비교하여 결과를 html로 출력
    if(player.point==computer.point){ //==> 플레이어와 컴퓨터의 point가 같으면 비김
        resultElement.innerHTML='플레이어의 점수 : '+player+" vs 컴퓨터 : "+computer+"==> 비겼습니다.";
    }else{
        if((player.point+1)%3==computer.point){
            /*
               # 플레이어의 point에 1을 더하고 3으로 나눈 나머지를 컴퓨터의 point와 매칭 시키면 무조건 컴퓨터 승리 조건

               플레이어  point  +1  %3     point 컴퓨터
                가위       0    1   1       1    바위   ==>  컴퓨터 승
                바위       1    2   2       2    보     ==> 컴퓨터 승
                보         2    3   0       3    가위   ==> 컴퓨터 승
            */

            resultElement.innerHTML='플레이어의 점수 : '+player+" vs 컴퓨터 : "+computer+"==> 컴퓨터가 이겼습니다.";
        }else{
            resultElement.innerHTML='플레이어의 점수 : '+player+" vs 컴퓨터 : "+computer+"==> 플레이어가 이겼습니다.";
        }
    }
}
//gameElement가 click되면 playRockScissorsPaper()함수를 실행
function init(){
    var gameElement=document.getElementById('game');
    addListener(gameElement, 'click', playRockScissorsPaper);
}

//ff나 ch가 load되면 addEventListener로 init()함수를 실행
//ie로 load되면 attachEvent로 init()함수를 실행
function addListener(el, ev, handler){
    if(el.addEventListener){
        el.addEventListener(ev, handler, false);
    }else{
        el.attachEvent('on'+ev, handler);
    }
}
//window가 load되면 int()함수 실행
addListener(window, 'load', init);