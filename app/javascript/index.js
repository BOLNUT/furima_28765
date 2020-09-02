window.addEventListener('load', function(){
  
  const priceWindow = document.getElementById("item-price")
  priceWindow.addEventListener('change', function(){
    var price = priceWindow.value
    var Fee = parseInt(price, 10) * (0.1)
    var Profit = parseInt(price, 10) - (Fee)
    document.getElementById("add-tax-price").innerHTML = String(Fee)
    document.getElementById("profit").innerHTML = String(Profit)
  })
}) 
