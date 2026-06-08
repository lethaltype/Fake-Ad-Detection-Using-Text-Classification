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
    const btnSignup = document.getElementById("btnSignup");

    
    //Add Signup Event
    btnSignup.addEventListener('click', e => {

        //get email and password
        const email = txtEmail.value;
        const password = txtPassword.value;

        const auth = firebase.auth();

        //sign in with firebase auth
        const promise = auth.createUserWithEmailAndPassword(email, password).then(user => {
            alert("Signup succesfull, click OK and you'll be redirected to Login Page")
            location.replace('/FYP/windex.html');
        }).catch(err => {
            alert(err.message);
        });
    });

}());
