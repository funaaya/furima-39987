window.addEventListener('load', function() {
  const priceInput = document.getElementById("price-input");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    // ここで販売利益の計算を行います。
    // 計算方法はフリマの仕様に依存しますが、
    // 例えば手数料が10%であれば以下のようになります。
    const profit = (inputValue * 0.9);

    const profitNumber = document.getElementById("profit");
    profitNumber.innerHTML = profit;

    pullDownButton.addEventListener('mouseout', function(){
      console.log("mouseout OK")
    })
  });
});
