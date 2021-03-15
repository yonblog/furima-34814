function post (){
  const priceForm = document.getElementById("item-price");
  priceForm.addEventListener('input', function(){
    const inputData = priceForm.value;
    console.log(inputData);

    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = (Math.floor(inputData * 0.1));
    console.log(addTaxPrice);
    
    const profitPrice = document.getElementById("profit");
    const extractingNumber = inputData * 0.1;
    console.log(extractingNumber);
    profitPrice.innerHTML = (Math.floor(inputData - extractingNumber));
    console.log(profitPrice);
  });
}

addEventListener('load', post);