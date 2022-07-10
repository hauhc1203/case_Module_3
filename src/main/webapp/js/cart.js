let link=document.getElementById("cart1")

let c=0;
function displayCart(){

  if (c==0){
    link.style.display='block';
    c++
  }else {
    link.style.display='none';
    c--;
  }
}




let link1=document.getElementById("haha")
let quantity = document.querySelectorAll('.form-control-sm');
link1.addEventListener('click',function (evt){
  evt.preventDefault()

  let c=0;
  for (let i = 0; i < quantity.length; i++) {
    c+= quantity[i].getAttribute('value')
  }
  if (c==0){
    alert("Chưa có gì để mua !!!")
  }else
    window.location.href=link1.getAttribute("href")
})

for (let i = 0; i < quantity.length; i++){
  quantity[i].addEventListener('change',function (evt){
    quantity[i].setAttribute("value",quantity[i].value)
  })
}



