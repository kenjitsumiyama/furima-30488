function price(){

 const i = document.getElementById("item-price")
 const a = document.getElementById("add-tax-price")
 const p = document.getElementById("profit")

 i.addEventListener('input', function(){
      let amount = document.getElementById('item-price').value; 
      let tax = Math.floor(amount * 0.1);
      let profit = Math.floor(amount * 0.9);
      a.innerHTML = tax;
      p.innerHTML = profit;
      })
 }
 window.addEventListener('input', price)
