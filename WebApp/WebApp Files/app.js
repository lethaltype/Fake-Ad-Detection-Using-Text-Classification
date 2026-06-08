const hamburger = document.querySelector('.header .nav-bar .nav-list .hamburger');
const mobile_menu = document.querySelector('.header .nav-bar .nav-list ul');
const menu_item = document.querySelectorAll('.header .nav-bar .nav-list ul li a');
const header = document.querySelector('.header.container');
const GO= document.onclick('')
hamburger.addEventListener('click', () => {
	hamburger.classList.toggle('active');
	mobile_menu.classList.toggle('active');
});

document.addEventListener('scroll', () => {
	var scroll_position = window.scrollY;
	if (scroll_position > 250) {
		header.style.backgroundColor = '#29323c';
	} else {
		header.style.backgroundColor = 'transparent';
	}
});

const txtURL = document.getElementById("URL");
console.log(txtURL)
const sendHTTPRequest=(method,url,data)=>{
	const promise =new Promise((resolve, reject)=>{
		const xhr= new XMLHttpRequest();
		xhr.open(method,url);
		
		xhr.responseType='json';

		if (data){
			xhr.setRequestHeader('Content-Type','application/json');
		}
		xhr.onload=()=>{
			resolve(xhr.response);
		};
		xhr.send(JSON.stringify(data));
	});
	return promise;
};
const get_data=()=>{
	sendHTTPRequest('GET','http://192.168.43.151:5000/result').then(responseData => { 
		console.log(responseData);
	});
};
const send_data=()=>{
	sendHTTPRequest('POST','http://192.168.43.151:5000/link',{
		link:'txtURL'}).then(responseData => { 
		console.log(responseData);
	});

};

btnSend.addEventListener('click',send_data);

btn.addEventListener('click',get_data);

//btnGO.addEventListener('click', () => { 
	//alert("LINK RECEVIED")
       // });

menu_item.forEach((item) => {
	item.addEventListener('click', () => {
		hamburger.classList.toggle('active');
		mobile_menu.classList.toggle('active');
	});

});
