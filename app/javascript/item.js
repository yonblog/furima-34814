function post (){
  const priceForm = document.getElementById("item-price");
  if (!priceForm){ return false;}
  priceForm.addEventListener(`input`, function() {
    const inputData = priceForm.value;

    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = (Math.floor(inputData * 0.1));
    
    const profitPrice = document.getElementById("profit");
    const extractingNumber = inputData * 0.1;
    profitPrice.innerHTML = (Math.floor(inputData - extractingNumber));
  });
};

addEventListener('load', post);