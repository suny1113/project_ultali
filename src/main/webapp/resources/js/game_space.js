// 배경 이미지 좌표
var bg1_X = 0;
var bg1_Y = 0;

var bg2_X = 0;
var bg2_Y = -800;

// 배경 이미지 객체
var bg1 = new Image();
bg1.src = "../images/space.jpg";

var bg2 = new Image();
bg2.src = "../images/space.jpg";


// 내 우주선 이미지 좌표
var gunship_X = 300;
var gunship_Y = 600;

// 내 우주선 이미지 객체
var gunship1 = new Image();
gunship1.src = "../images/gunship4.png";

var gunship2 = new Image();
gunship2.src = "../images/gunship5.png";

var gunship3 = new Image();
gunship3.src = "../images/gunship6.png";

var gunship4 = new Image();
gunship4.src = "../images/gunship7.png";


// 적 우주선 이미지 좌표
var enemy_X = Math.floor(Math.random()*600);
var enemy_Y = -50;

// 적 우주선 이미지 객체
// 타입1 : 은색 적 우주선
var enemy1 = new Image();
enemy1.src = "../images/gunship0.png";

var enemy2 = new Image();
enemy2.src = "../images/gunship1.png";

var enemy3 = new Image();
enemy3.src = "../images/gunship2.png";

var enemy4 = new Image();
enemy4.src = "../images/gunship3.png";

// 타입2 : 노란색 적 우주선
var enemy5 = new Image();
enemy5.src = "../images/gunship11.png";

var enemy6 = new Image();
enemy6.src = "../images/gunship12.png";

var enemy7 = new Image();
enemy7.src = "../images/gunship13.png";

var enemy8 = new Image();
enemy8.src = "../images/gunship14.png";

// 타입3 : 파란색 적 우주선
var enemy9 = new Image();
enemy9.src = "../images/gunship21.png";

var enemy10 = new Image();
enemy10.src = "../images/gunship22.png";

var enemy11 = new Image();
enemy11.src = "../images/gunship23.png";

var enemy12 = new Image();
enemy12.src = "../images/gunship24.png";

// 적 우주선 배열
var enemy_array = [];


// 적 보스 이미지 좌표
var enemy_boss_X;
var enemy_boss_Y;

// 적 보스 이미지 객체
var enemy_boss = new Image();
enemy_boss.src = "../images/battle.png";


// 미사일 이미지 좌표
var missile1_X;
var missile1_Y;

var missile2_X = -250;
var missile2_Y = -550;

// 미사일 이미지 객체
var missile1 = new Image();
missile1.src = "../images/missile.png";

var missile2 = new Image();
missile2.src = "../images/missile1.png";

// 미사일 배열
var missile_array = [];


// BGM 객체
var bgm = new Audio("../sounds/Burning_Body.mp3");

// 미사일 발사 소리 객체
var fireSound = new Audio("../sounds/fire2.wav");


// 점수 변수
var score = 0;

// 게임 진행 상태 변수
var isGameOver = false;

// 캔버스 변수
var canvas;

// 카운터 변수
var counter = 0;

// 그리기 변수
var ctx;


// 로드와 동시에 실행되는 익명 함수
window.onload = function () {
    canvas = document.getElementById("can");
    ctx = canvas.getContext("2d");

    // 캔버스 내에서 마우스를 움직일 때 moveShip() 실행
    canvas.onmousemove = moveShip;

    // 캔버스 내에서 마우스를 클릭할 때 fire() 실행
    canvas.onmousedown = fireMissile;

    // 게임이 중지된 상태에서 키를 누를 때 reset() 실행
    var body = document.body;
    body.onkeydown = resetGame;

    // 적 우주선 반복 생성
    window.setInterval(makeEnemy, 1000);

    // draw() 반복 실행
    window.setInterval(draw, 10);
}


// 리셋 함수
function resetGame(e) {
    // x 키를 누르면
    if(e.keyCode == 88) {
        isGameOver = false;
        canvas.onmousemove = moveShip;
        canvas.onmousedown = fireMissile;

        // 내 우주선 위치, 점수 초기화
        gunship_X = 300;
        gunship_Y = 600;
        score = 0;
    }
}


// 그리기 함수
function draw() {
    counter++;

    // 배경 이미지 : 위에서 아래로 이동
    bg1_Y += 1;
    bg2_Y += 1;

    // 배경 이미지 : 무한 반복
    if(bg1_Y == 800) {
        bg1_Y = -800;
        bg2_Y = 0;
    }

    if(bg2_Y == 800) {
        bg1_Y = 0;
        bg2_Y = -800;
    }

    // 미사일 이미지 : 아래서 위로 이동
    for(var i = 0; i < missile_array.length; i++) {
        var m = missile_array[i];
        m.y -= 3;
    }

    // 적 우주선 이미지 : 위에서 아래로 이동
    for(var i = 0; i < enemy_array.length; i++) {
        var e = enemy_array[i];
        e.y += 3;
    }


    // 배경 그리기
    ctx.drawImage(bg1, bg1_X, bg1_Y, 600, 800);
    ctx.drawImage(bg2, bg2_X, bg2_Y, 600, 800);

    // 내 우주선 그리기
    if(counter % 4 == 0)        ctx.drawImage(gunship1, gunship_X-25, gunship_Y-25, 50, 50);
    else if(counter % 4 == 1)   ctx.drawImage(gunship2, gunship_X-25, gunship_Y-25, 50, 50);
    else if(counter % 4 == 2)   ctx.drawImage(gunship3, gunship_X-25, gunship_Y-25, 50, 50);
    else if(counter % 4 == 3)   ctx.drawImage(gunship4, gunship_X-25, gunship_Y-25, 50, 50);

    // 적 우주선 배열에서 하나씩 꺼내서
    for(var i = 0; i < enemy_array.length; i++) {
        var e = enemy_array[i];
        
        // 타입에 따른 적 우주선 그리기
        if(e.type == 1) {
            if(counter % 4 == 0)        ctx.drawImage(enemy1, e.x-25, e.y-25, 50, 50);
            else if(counter % 4 == 1)   ctx.drawImage(enemy2, e.x-25, e.y-25, 50, 50);
            else if(counter % 4 == 2)   ctx.drawImage(enemy3, e.x-25, e.y-25, 50, 50);
            else if(counter % 4 == 3)   ctx.drawImage(enemy4, e.x-25, e.y-25, 50, 50);
        }
        else if(e.type == 2) {
            if(counter % 4 == 0)        ctx.drawImage(enemy5, e.x-25, e.y-25, 50, 50);
            else if(counter % 4 == 1)   ctx.drawImage(enemy6, e.x-25, e.y-25, 50, 50);
            else if(counter % 4 == 2)   ctx.drawImage(enemy7, e.x-25, e.y-25, 50, 50);
            else if(counter % 4 == 3)   ctx.drawImage(enemy8, e.x-25, e.y-25, 50, 50);
        }
        else if(e.type == 3) {
            if(counter % 4 == 0)        ctx.drawImage(enemy9, e.x-25, e.y-50, 100, 100);
            else if(counter % 4 == 1)   ctx.drawImage(enemy10, e.x-25, e.y-50, 100, 100);
            else if(counter % 4 == 2)   ctx.drawImage(enemy11, e.x-25, e.y-50, 100, 100);
            else if(counter % 4 == 3)   ctx.drawImage(enemy12, e.x-25, e.y-50, 100, 100);
        }


        if(e.y > 800) {
            enemy_array.shift();
        }
    }

    // 미사일 그리기 (미사일 배열에서 하나씩 꺼내기)
    for(var i = 0; i < missile_array.length; i++) {
        var m = missile_array[i];
        ctx.drawImage(missile2, m.x, m.y, 5, 20);

        // 화면 밖으로 벗어나면 제거
        if(m.y < 0) {
            missile_array.shift();  
            
            // shift() : 배열 맨 앞의 값 삭제
            // unshift() : 배열 맨 앞에 값 추가

            // push() : 배열 맨 마지막에 추가
            // pop() : 배열 맨 마지막을 꺼내기
        }
    }

    checkCollision();       // 미사일 충돌 검사 함수 실행
    checkShipCollision();   // 우주선 충돌 검사 함수 실행


    // 점수 텍스트 그리기
    ctx.font = "30px 고딕";
    ctx.fillStyle = "red";
    ctx.fillText("score : " + score, 250, 30);

    // 게임 오버 되었을 경우, GAME OVER 문구 띄우기
    if(isGameOver) {
        ctx.font = "90px 고딕";
        ctx.fillText("GAME OVER", 50, 300);
        
        ctx.font = "30px 고딕";
        ctx.fillText("Please Insert Coin", 190, 400);
    }
}// draw() end


// 미사일 충돌 검사 함수
function checkCollision() {
    // 적 우주선 배열에서 하나씩 좌표 가져오기
    for(var i = 0; i < enemy_array.length; i++) {
        var e = enemy_array[i];
        // 미사일 배열에서 하나씩 좌표 가져오기
        for(var j = 0; j < missile_array.length; j++) {
            var m = missile_array[j];

            // 적 우주선과 미사일 사이의 거리
            var dis = distance(e.x, e.y, m.x, m.y);

            // 적중했을 경우
            if(dis < 40) {
                // 미사일 사라짐
                m.x = -300;

                // 적 우주선의 체력 감소
                e.hp -= 100;

                // 맞으면 약간 뒤로 밀리는 효과
                e.y -= 20;

                // 체력이 0 이 될 경우
                if(e.hp <= 0) {
                    // 적 우주선 사라짐
                    e.x = -800;

                    // 점수 획득
                    score += type*100;
                }
            }
        }
    }  
}


// 우주선 충돌 검사 함수
function checkShipCollision() {
    for(var i = 0; i < enemy_array.length; i++) {
        var e = enemy_array[i];
        var dis = distance(e.x, e.y, gunship_X, gunship_Y);

        if(dis < 60) {
            gameOver();
        }
    }
}


// 게임 오버 함수
function gameOver() {
    isGameOver = true;
    canvas.onmousemove = '';
    canvas.onmousedown = '';
}


// 마우스를 움직이면 내 우주선도 따라 움직이는 함수
function moveShip(e) {
    gunship_X = e.pageX;
    gunship_Y = e.pageY;
}


// 마우스를 클릭하면 미사일을 발사하는 함수
function fireMissile(e) {
    // 미사일 발사 소리
    fireSound.currentTime = 0;
    fireSound.play();

    // 미사일 발사 위치 조정
    missile2_X = e.pageX-2;
    missile2_Y = e.pageY-30; 

    // 미사일 객체
    var m = {
        x : missile2_X,
        y : missile2_Y
    }

    // 미사일 객체를 배열에 담기
    missile_array.push(m);
}


// 적 우주선 생성 함수
function makeEnemy() {

    // 랜덤 X 좌표값 생성
    var pos = Math.floor(Math.random()*550);

    // 랜덤 타입값 생성 (1 또는 2)
    var t = Math.floor(Math.random()*3+1);

    // 1. 일반 적 우주선
    // 2. 상위 적 우주선 (노란색, 체력 상승)
    // 3. 보스 적 우주선 (파란색, 크기와 체력 상승)
    var enemy = {
        x : pos,
        y : -50,
        type : t,
        hp : t*100
    }

    // 적 우주선 배열에 담기
    enemy_array.push(enemy);
}


// 거리 측정 함수
function distance(x1, y1, x2, y2) {
    return Math.sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1));
}

function bgmOn() {
    bgm.play();
}

function bgmOff() {
    bgm.currentTime = 0;
    bgm.pause();
}