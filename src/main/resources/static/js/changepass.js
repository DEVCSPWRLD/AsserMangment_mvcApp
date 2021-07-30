//eye
var state= false;
    function toggle(){
        if(state)
        
        {
        document.getElementById("form_password").setAttribute("type","password");
        document.getElementById("eye").style.color='#7a797e';
        state = false;
         }
         else{
        document.getElementById("form_password").setAttribute("type","text");
        document.getElementById("eye").style.color='#5887ef';
        state = true;
         }
    }
    var state= false;
    function toggle1(){
        if(state)
        
        {
        document.getElementById("form_Npassword").setAttribute("type","password");
        document.getElementById("eye1").style.color='#7a797e';
        state = false;
         }
         else{
        document.getElementById("form_Npassword").setAttribute("type","text");
        document.getElementById("eye1").style.color='#5887ef';
        state = true;
         }
    }
    var state= false;
    function toggle2(){
        if(state)
        
        {
        document.getElementById("form_Cpassword").setAttribute("type","password");
        document.getElementById("eye2").style.color='#7a797e';
        state = false;
         }
         else{
        document.getElementById("form_Cpassword").setAttribute("type","text");
        document.getElementById("eye2").style.color='#5887ef';
        state = true;
         }
    }
   

//checklist
function checklist(){
 
var myInput=document.getElementById("form_Npassword");
var letter=document.getElementById("letter");
var capital=document.getElementById("capital");
var number=document.getElementById("number");
var special1=document.getElementById("special");
var length=document.getElementById("length");
myInput.onfocus=function()
{
   document.getElementById("message").style.display="block";
  }
myInput.onblur=function()
{
   document.getElementById("message").style.display="none";
  }
myInput.onkeyup=function()
{
    var lowercase=/[a-z]/g;
    if(myInput.value.match(lowercase))
        {
        letter.classList.remove("invalid");
        letter.classList.add("valid");
    }
    else
        {
        letter.classList.remove("valid");
        letter.classList.add("invalid");
        }
    var uppercase=/[A-Z]/g;
    if(myInput.value.match(uppercase))
        {
        capital.classList.remove("invalid");
        capital.classList.add("valid");
    }
    else
        {
        capital.classList.remove("valid");
        capital.classList.add("invalid");
        }
    var numbers=/[0-9]/g;
    if(myInput.value.match(numbers))
        {
        number.classList.remove("invalid");
        number.classList.add("valid");
    }
    else
        {
        number.classList.remove("valid");
        number.classList.add("invalid");
        }
     var special=/(?=.*[ -\/:-@\[-\`{-~]{1,})/g;
    if(myInput.value.match(special))
        {
        special1.classList.remove("invalid");
        special1.classList.add("valid");
    }
    else
        {
        special1.classList.remove("valid");
        special1.classList.add("invalid");
        }

 

    if(myInput.value.length>=8)
    {
        length.classList.remove("invalid");
        length.classList.add("valid");
}
else
    {
    length.classList.remove("valid");
    length.classList.add("invalid");
    }
    
}
}