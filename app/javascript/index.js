window.addEventListener('load', function(){
  const addFee = document.getElementById("item-price")
  addFee.addEventListener('onchange', function(){

    var Fee = parseInt(addFee, 10) * 0.1
    var Profit = parseInt(addFee, 10) - Fee
    resultForm1 = document.getElementById("add-tax-price")
    resultForm2 = document.getElementById("profit")
    resultForm1.value = Fee
    resultForm2.value = Profit
  })
})