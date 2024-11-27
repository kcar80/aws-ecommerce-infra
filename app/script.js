let cart = [];
let total = 0;

function addToCart(product, price) {
    cart.push({ product, price });
    total += price;
    updateCart();
}

function updateCart() {
    const cartItems = document.getElementById('cartItems');
    cartItems.innerHTML = '';
    
    cart.forEach(item => {
        const li = document.createElement('li');
        li.textContent = `${item.product} - $${item.price.toFixed(2)}`;
        cartItems.appendChild(li);
    });

    const totalPrice = document.getElementById('totalPrice');
    totalPrice.textContent = total.toFixed(2);
}
