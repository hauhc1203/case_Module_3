let link1=document.getElementById("confirm")

let quantity = document.querySelectorAll('.form-control-sm');


let link=document.getElementById("cart1")

let c1=0;
function displayCart(){

  if (c1==0){
    link.style.display='block';
    c1++
  }else {
    link.style.display='none';
    c1--;
  }
}


link1.addEventListener('click',function (evt){
  evt.preventDefault()
  let c=0;
  for (let i = 0; i < quantity.length; i++) {
    console.log( quantity[i].value
    )
    c+= quantity[i].getAttribute('value')
  }
  if (c==0){
    alert("Chưa có gì để mua !!!")
  }else
    window.location.href=link1.getAttribute("href")
})





