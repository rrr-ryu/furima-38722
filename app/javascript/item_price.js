function price (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit")
    const taxPrice = itemPrice.value / 10;
    const profitPrice = itemPrice.value - Math.floor(taxPrice)
    if (itemPrice.value == ``){
      addTaxPrice.innerHTML = ``
      profit.innerHTML = ``
    }else if (itemPrice.value > 9999999) {
      addTaxPrice.innerHTML = `NaN`
      profit.innerHTML = `NaN`
    }else if (itemPrice.value >=300) {
      addTaxPrice.innerHTML = `${Math.floor(taxPrice)}`
      profit.innerHTML = `${profitPrice}` 
    }else {
      addTaxPrice.innerHTML = `NaN`
      profit.innerHTML = `NaN`
    };
  });
};
window.addEventListener('load', price);