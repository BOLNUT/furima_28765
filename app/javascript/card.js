const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);// PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
 
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    
    //FormDataの取得
    const numberInput = document.getElementById("card-number").value
    const cvcInput = document.getElementById("card-cvc").value
    const monthInput = document.getElementById("card-exp-month").value
    const yearInput = document.getElementById("card-exp-year").value
    
    //FormDataの取得した値をinteger型へ
    const number = parseInt(numberInput, 10)
    const cvc = parseInt(cvcInput, 10)
    const exp_month = parseInt(monthInput, 10)
    const sumYear = 20 + yearInput
    const exp_year = parseInt(sumYear, 10)

    const card = {
      number: number,
      cvc: cvc,
      exp_month: exp_month,
      exp_year: exp_year,
    };
    //card 中身確認
    console.log(card)

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);        
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      }else{
        console.log("false")
      }
    });
  });
 };
 
 window.addEventListener("load", pay);