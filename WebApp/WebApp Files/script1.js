(function () {
    
    // Your web app's Firebase configuration
    var firebaseConfig = {
      apiKey: "AIzaSyAexGUJ77hzGigB2rQ3EntL5mNwSYbioBk",
      authDomain: "carzio-ed49e.firebaseapp.com",
      projectId: "carzio-ed49e",
      storageBucket: "carzio-ed49e.appspot.com",
      messagingSenderId: "801338590074",
      appId: "1:801338590074:web:71f43dd1cb0252c64dccc3",
      measurementId: "G-5CPQED66W6"
  };
  firebase.initializeApp(firebaseConfig);
  

    //Get Elements
    const txtEmail = document.getElementById("txtEmail");
    const txtPassword = document.getElementById("txtPassword");
    const btnLogin = document.getElementById("btnLogin");

//Add Login Event
btnLogin.addEventListener('click', e => {
    const email = txtEmail.value;
    const password = txtPassword.value;

    const auth = firebase.auth();

    //sign in with firebase auth
    auth.signInWithEmailAndPassword(email, password).then(user =>{
     location.replace('/FYP/index1.html');
    }).catch(err => {   
        alert(err.message);
        
   });
    });

}());
