const form = document.querySelector('#form')
const uname = document.querySelector('#uname');
const email = document.querySelector('#email');
const mobileno = document.querySelector('#mobileno');
const password = document.querySelector('#password');
const cnfpassword = document.querySelector('#cnfpassword');


console.log(uname.value);

form.addEventListener('submit',(e)=>{
    e.preventDefault();
    validateInputs();
})

function validateInputs(){
    const nameval = uname.value.trim();
    const emailval = email.value.trim();
    const mobilenoval = mobileno.value.trim();
    const passwordval = password.value.trim();
    const cnfpasswordval = cnfpassword.value.trim();


    if(nameval==''){
        setError(uname,'Enter Your Name')
    }
    else{
        setSuccess(uname)
    }
    if(emailval==''){
        setError(email,'Enter Email')
    }
    else if(!validateEmail(emailval)){
        setError(email,'Enter Valid Email ')
    }
    else{
        setSuccess(email)
    }
    if(mobilenoval==''){
        setError(mobileno,'Enter Mobile No')
    }
    else if(!(/^\d{10}$/.test(mobilenoval))){
        setError(mobileno,'Enter Valid Mobile No')
    }
    else{
        setSuccess(mobileno)
    }
    if(passwordval==''&&cnfpasswordval==''){
        setError(password,'Enter Password');
        setError(cnfpassword,'Enter Confirm Password');
        
    }
    else if(passwordval==''){
        setError(password,'Enter Password');
    }
    else if(cnfpasswordval==''){
        setError(cnfpassword,'Enter Confirm Password');
    }
    else if(passwordval.length<8){
        setError(password,'Password must be atleast 8 Character')
        setError(cnfpassword,'Password must be atleast 8 Character')
    }
    else if(passwordval!==cnfpasswordval){
        setError(password,'Password mismatch')
        setError(cnfpassword,'Password mismatch')
    }
    else{
            setSuccess(password)
            setSuccess(cnfpassword)
    }
}

function setError(element,message){
    const inputGroup = element.parentElement;
    const errorElement = inputGroup.querySelector('.error')

    errorElement.innerText=message;
    inputGroup.classList.add('error');
}   

function setSuccess(element){
    const inputGroup = element.parentElement;
    const errorElement = inputGroup.querySelector('.error')

    errorElement.innerText='';
    inputGroup.classList.remove('error');
}

const validateEmail = (email) => {
    return String(email)
      .toLowerCase()
      .match(
        /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
      );
  };


const validateMobile = (mobileno) => {
    return String(mobileno)
      .match(
        /^\d{3}-\d{3}-\d{4}$/
      );
  }
  
  
  
  
  
  