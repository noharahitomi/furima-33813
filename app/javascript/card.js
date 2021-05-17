const pay = () => {
  Payjp.setPublicKey("pk_test_16b0134594a4a76470492275");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e)=> {
    e.preventDefault();
    
  });
};

window.addEventListener("load", pay);