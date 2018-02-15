window.onload = function() { //加载完毕后才获取元素
	var container = document.getElementById('container'); //获取容器
	var list = document.getElementById('list');
	var buttons = document.getElementById('buttons').getElementsByTagName('span');
	var prev = document.getElementById('prev');
	var next = document.getElementById('next');
	var index = 1; //圆点
	var animated = false;
	var timer;

	function showButton() {
		for(var i = 0; i < buttons.length; i++) {
			if(buttons[i].className == 'on') {
				buttons[i].className = '';
				break;
			}
		}
		buttons[index - 1].className = 'on'; //改变它的属性
	}

	function animate(offset) {
		animated = true;
		var newLeft = parseInt(list.style.left) + offset;
		var time = 500;//位移总时间
		var interval = 10;//每次位移的时间
		var speed = offset/(time/interval);//每次位移量
		
		function go(){
			if((speed<0&&parseInt(list.style.left)>newLeft)||(speed>0&&parseInt(list.style.left)<newLeft)){
				list.style.left = parseInt(list.style.left)+speed+'px';
				setTimeout(go,interval);//只执行一次
			}
			else{
				animated = false;
				list.style.left = newLeft + 'px';

				if(newLeft > -1240) {
					list.style.left = -6200 + "px";
				}
				if(newLeft < -6200) {
					list.style.left = -1240 + "px";
				}
			}
		}

		go();
	}

	function play(){
		timer = setInterval(function(){//一直执行
			next.onclick();
		},3000);
	}

	function stop(){
		clearInterval(timer);
	}

	next.onclick = function() {
		if(index==5){
			index=1;
		}else{
			index += 1;	
		}
		
		showButton();
		if(animated == false){
			animate(-1240);
		}
		
	}
	
	prev.onclick = function() {
		if(index==1){
			index=5;
		}else{
			index -= 1;	
		}
		showButton();
		if(animated == false){
			animate(1240);
		}
	}
	
	for(var i =0;i<buttons.length;i++){
		buttons[i].onclick = function(){
			if(this.className == 'on'){
				return;
			}
			var myindex = parseInt(this.getAttribute('index'));//获取自定义属性的值
			var offset = -1240*(myindex - index);
			
			if(animated == false){
				animate(offset);
			}
			
			index =myindex;
			showButton();
		}
	}
	container.onmouseover = stop;
	container.onmouseout = play;
	
	play();
}