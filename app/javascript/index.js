window.addEventListener('load', function(){
  
  var addFee = document.getElementById("item-price")
  addFee.addEventListener('onchange', function(){
    var valueAddFee = document.getElementById("item-price").value
    var Fee = parseInt(valueAddFee, 10) * (0.1)
    var Profit = parseInt(valueAddFee, 10) - (Fee)
    document.getElementById("add-tax-price").innerHTML = String(Fee)
    document.getElementById("profit").innerHTML = String(Profit)
})
}) 
